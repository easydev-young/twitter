import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/view_models/login_view_model.dart';
import 'package:onboarding_flow_part1/features/authentication/views/sign_up_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeURL = "/login";
  static const routeName = "login";
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(loginProvider.notifier).login(
              formData["email"]!,
              formData["password"]!,
              context,
            );
      }
    }
  }

  void _onCreateAccountPressed(BuildContext context) {
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'English (US)',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Gaps.v40,
                  const Icon(
                    FontAwesomeIcons.squareThreads,
                    size: 100,
                  ),
                  Gaps.v40,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Mobile number or email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Plz write your email";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Plz write your password";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['password'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: FormButton(
                      buttonName: 'Log in',
                      disabled: ref.watch(loginProvider).isLoading,
                    ),
                  ),
                  Gaps.v10,
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                  //const Spacer(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () => _onCreateAccountPressed(context),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Create new account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ),
                Gaps.v20,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.meta,
                      color: Colors.grey.shade700,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Meta",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gaps.v20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
