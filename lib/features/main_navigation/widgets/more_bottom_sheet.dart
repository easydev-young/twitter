import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/report_bottom_sheet.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';

class MoreBottomSheet extends ConsumerWidget {
  const MoreBottomSheet({super.key});

  void _onTapReport(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      builder: (context) => const ReportBottomSheet(),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(displayConfigProvider).darkMode;
    return Container(
      height: 340,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
        backgroundColor: isDark ? Colors.grey.shade900 : null,
        body: Center(
          child: Column(
            children: [
              Gaps.v14,
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(Sizes.size3),
                ),
              ),
              Gaps.v16,
              Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.size24,
                  right: Sizes.size24,
                ),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(Sizes.size20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(Sizes.size18),
                        child: Text(
                          'Unfollow',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300.withOpacity(0.7),
                        height: 1,
                        thickness: 1,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(Sizes.size18),
                        child: Text(
                          'Mute',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.v20,
              Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.size24,
                  right: Sizes.size24,
                ),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(Sizes.size20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(Sizes.size18),
                        child: Text(
                          'Hide',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300.withOpacity(0.7),
                        height: 1,
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () => _onTapReport(context),
                        child: Padding(
                          padding: const EdgeInsets.all(Sizes.size18),
                          child: SizedBox(
                            width: 120,
                            height: 20,
                            child: Text(
                              'Report',
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
