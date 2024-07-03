import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';
import 'package:onboarding_flow_part1/features/authentication/choose_interests.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool isButtonDisabled = true;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmitTap() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseInterests(
          userData: widget.userData,
        ),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBarWidget(
          leadingType: LeadingType.none,
          onLeadingTap: () {
            // 여기서 onTap 액션을 정의합니다.
          },
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
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "You'll need a password",
                              style: TextStyle(
                                fontSize: Sizes.size28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: Sizes.size10),
                            Text(
                              "Make sure it's 8 characters or more.",
                              style: TextStyle(
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
                      TextField(
                        controller: _passwordController,
                        onEditingComplete: _onSubmitTap,
                        obscureText: _obscureText,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffix: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: _onClearTap,
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  color: Colors.grey.shade500,
                                  size: Sizes.size20,
                                ),
                              ),
                              Gaps.h16,
                              GestureDetector(
                                onTap: _toggleObscureText,
                                child: FaIcon(
                                  _obscureText
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey.shade500,
                                  size: Sizes.size20,
                                ),
                              ),
                              Gaps.h16,
                              Icon(
                                Icons.check_circle,
                                color: _isPasswordValid()
                                    ? Colors.green
                                    : Colors.grey.shade400,
                              )
                            ],
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                      ),
                      Gaps.v12,
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
          height: 80,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => _onSubmitTap(),
                  child: SizedBox(
                    width: 310,
                    height: 50,
                    child: FormButton(
                        disabled: !_isPasswordValid(), buttonName: "Next"),
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
