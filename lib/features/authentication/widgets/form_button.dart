import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.buttonName,
  });

  final bool disabled;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size24),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: Center(
          // 텍스트를 가운데 정렬하기 위해 Center 위젯 사용
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 500),
            style: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
              color: disabled ? Colors.grey.shade400 : Colors.white,
            ),
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
