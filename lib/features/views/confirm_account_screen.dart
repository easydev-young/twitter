import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';
import 'package:onboarding_flow_part1/features/views/email_verification.dart';

class ConfirmAccountScreen extends StatefulWidget {
  const ConfirmAccountScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;
  @override
  State<ConfirmAccountScreen> createState() => _ConfirmAccountScreenState();
}

class _ConfirmAccountScreenState extends State<ConfirmAccountScreen> {
  void _onSubmitTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerification(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gaps.v32,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Gaps.v32,
              TextFormField(
                readOnly: true,
                controller: (TextEditingController(text: widget.userData.name)),
                decoration: InputDecoration(
                  hintText: widget.userData.name,
                  labelText: "Name",
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v28,
              TextFormField(
                readOnly: true,
                controller:
                    (TextEditingController(text: widget.userData.phoneOrEmail)),
                decoration: InputDecoration(
                  hintText: widget.userData.phoneOrEmail,
                  labelText: "Phone number or email address",
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v28,
              TextFormField(
                readOnly: true,
                controller:
                    (TextEditingController(text: widget.userData.dateOfBirth)),
                decoration: InputDecoration(
                  hintText: widget.userData.dateOfBirth,
                  labelText: "Date of birth",
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v80,
              Gaps.v40,
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: "montserrat",
                      color: Colors.black54,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: "By signning up, you agree to our "),
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
                      const TextSpan(
                          text:
                              ". Others will be able to find you by emial or phone number, when provided unless you choose otherwise"),
                      TextSpan(
                        text: " here",
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
              child: const SizedBox(
                width: 310,
                height: 50,
                child: FormButton(disabled: false, buttonName: "Sign up"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
