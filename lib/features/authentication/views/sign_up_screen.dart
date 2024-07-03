import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/view_models/signup_view_model.dart';
import 'package:onboarding_flow_part1/features/authentication/views/login_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeURL = "/signUp";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Map<String, String> formData = {};

  void _onTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void _onLoginPressed(BuildContext context) {
    context.pushNamed(LoginScreen.routeName);
    //context.pop();
  }

  void _onNextTap() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_validateEmail(email) && _validatePassword(password)) {
      ref.read(signUpForm.notifier).state = {
        "email": email,
        "password": password,
      };
      ref.read(signUpProvider.notifier).signUp(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  bool _validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Mobile number or email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['password'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  GestureDetector(
                    onTap: _onNextTap,
                    child: FormButton(
                      buttonName: 'Sign up',
                      disabled: ref.watch(signUpProvider).isLoading,
                    ),
                  ),
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
                  onPressed: () => _onLoginPressed(context),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Go to Login Screen',
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
