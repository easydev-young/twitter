import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/utils.dart';
import 'package:onboarding_flow_part1/features/views/create_account_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onCreateAccounTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leadingType: LeadingType.none,
        onLeadingTap: () {
          // 여기서 onTap 액션을 정의합니다.
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gaps.v60,
                Gaps.v40,
                const Opacity(
                  opacity: 0.7,
                  child: Text(
                    "Do you want to know what's happening in the world right now?",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gaps.v60,
                Gaps.v40,
                const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  text: "Continue with Facebook",
                ),
                Gaps.v16,
                const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple",
                ),
                Gaps.v16,
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onCreateAccounTap(context),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: Sizes.size1,
                        ),
                        borderRadius: BorderRadius.circular(Sizes.size28),
                      ),
                      child: const Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Gaps.v24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'By signing up, you agree to our',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h5,
                    Text(
                      'Terms',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Text(
                      ',',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Text(
                      ',',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h5,
                    const Text(
                      'and',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h5,
                    Text(
                      'Cookie Use',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Text(
                      '.',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode(context) ? null : Colors.grey.shade50,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Have an account already? ',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h24,
              Text(
                "Log in",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
