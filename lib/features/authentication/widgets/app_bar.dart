import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

enum LeadingType {
  cancel,
  back,
  none;
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final LeadingType leadingType;
  final VoidCallback? onLeadingTap;

  const AppBarWidget({
    super.key,
    required this.leadingType,
    this.onLeadingTap,
  });

  Widget? getLeadingWidget(LeadingType type, VoidCallback? onTap) {
    switch (type) {
      case LeadingType.cancel:
        return GestureDetector(
          onTap: onTap,
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      case LeadingType.back:
        return IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: onTap,
        );
      case LeadingType.none:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 90,
      leading: getLeadingWidget(leadingType, onLeadingTap),
      title: const Icon(
        FontAwesomeIcons.dove,
        color: Colors.blue,
        size: 32.0, // Sizes.size32를 직접 숫자로 대체
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: const [SizedBox(width: 90)], // leading과 균형 맞추기 위해
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
