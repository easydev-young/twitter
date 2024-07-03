import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';
import 'package:onboarding_flow_part1/features/authentication/create_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({
    super.key,
    required this.userData,
  });

  final UserData userData;
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

void _cancelTap(BuildContext context) {
  Navigator.of(context).pop();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController _pinCodeController = TextEditingController();
  bool isButtonDisabled = true;
  String correctCode = "123457";

  void _onSubmitTap() {
    if (isButtonDisabled) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePassword(
          userData: widget.userData,
        ),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    // _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBarWidget(
          leadingType: LeadingType.back,
          onLeadingTap: () => _cancelTap(context),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size36,
                  ),
                  child: Column(
                    children: [
                      Gaps.v20,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "We sent you a code",
                              style: TextStyle(
                                fontSize: Sizes.size26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Sizes.size10),
                            const Text(
                              "Enter it below to verify",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              widget.userData.phoneOrEmail,
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v36,
                      Gaps.v20,
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          setState(() {
                            isButtonDisabled = value != correctCode;
                          });
                        },
                        controller: _pinCodeController,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                      ),
                      Gaps.v12,
                      !isButtonDisabled
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          width: 310,
          height: 100,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Didn't receive email?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Gaps.v16,
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => _onSubmitTap(),
                  child: SizedBox(
                    width: 310,
                    height: 50,
                    child: FormButton(
                        disabled: isButtonDisabled, buttonName: "Next"),
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
