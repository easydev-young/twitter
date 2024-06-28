import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/features/views/confirm_account_screen.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;
  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool _allow = false;
  get isNext => _allow;

  void _onSwitchChanged(bool isOn) {
    setState(() {
      _allow = isOn;
    });
  }

  void _onSubmitTap() {
    if (!_allow) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmAccountScreen(
          userData: widget.userData,
        ),
      ),
    );
  }

  void _cancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leadingType: LeadingType.back,
        onLeadingTap: () => _cancelTap(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.v24,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Customize your experience',
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w900,
                    ),
                    //textAlign: TextAlign.left,
                  ),
                ),
                Gaps.v24,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Track where you see Twitter',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'content across the web',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Gaps.v24,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Twitter uses this data to personalize your experience. This web browsing historty will never be stored with your name, email, or phone number.",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Gaps.h14,
                      Switch.adaptive(
                        value: _allow,
                        onChanged: _onSwitchChanged,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Gaps.v24,
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: "montserrat",
                        color: Colors.black54.withOpacity(0.7),
                        height: 1.5,
                        fontSize: 15,
                      ),
                      children: [
                        const TextSpan(
                            text: "By signing up, you agree to our "),
                        TextSpan(
                          text: "Terms",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const TextSpan(text: ", "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const TextSpan(text: ", and "),
                        TextSpan(
                          text: "Cookie Use",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const TextSpan(
                            text:
                                ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. "),
                        TextSpan(
                          text: "Learn more",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
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
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size3,
          ),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _onSubmitTap(),
              child: SizedBox(
                width: 310,
                height: 50,
                child: FormButton(disabled: !isNext, buttonName: "Next"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
