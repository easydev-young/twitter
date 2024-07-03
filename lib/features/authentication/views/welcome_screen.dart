import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/view_models/social_auth_view_model.dart';
import 'package:onboarding_flow_part1/features/authentication/views/login_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/views/sign_up_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/utils.dart';
import 'package:onboarding_flow_part1/features/authentication/create_account_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/auth_button.dart';

class WelcomeScreen extends ConsumerWidget {
  static const routeURL = "/welcome";
  static const routeName = "welcome";
  const WelcomeScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  void _onCreateAccountPressed(BuildContext context) {
    context.pushNamed(SignUpScreen.routeName);
  }

  void _onTapLogin(BuildContext context) {
    context.pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                GestureDetector(
                  onTap: () => _onCreateAccountPressed(context),
                  child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.user),
                    text: "Use email & password",
                  ),
                ),
                Gaps.v16,
                GestureDetector(
                  onTap: () => ref
                      .read(socialAuthProvider.notifier)
                      .githubSignIn(context),
                  child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.github),
                    text: "Continue with Github",
                  ),
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
          child: GestureDetector(
            onTap: () => _onTapLogin(context),
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
      ),
    );
  }
}
