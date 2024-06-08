import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({
    super.key,
    required this.userData,
  });

  final UserData userData;

  void _cancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.v60,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                GestureDetector(
                    onTap: () => _cancelTap(context),
                    child: const FaIcon(FontAwesomeIcons.arrowLeft)),
                Align(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.dove,
                    color: Theme.of(context).primaryColor,
                    size: Sizes.size24,
                  ),
                ),
              ],
            ),
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
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: userData.name,
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
                const Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Gaps.v28,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: userData.phoneOrEmail,
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
                const Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Gaps.v28,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  enabled: true,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: userData.dateOfBirth,
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
                const Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Gaps.v80,
            Gaps.v80,
            Gaps.v40,
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
              child: SizedBox(
                width: 350,
                height: 50,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: AnimatedContainer(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size20),
                      color: Theme.of(context).primaryColor,
                    ),
                    duration: const Duration(milliseconds: 500),
                    child: const Center(
                      // 텍스트를 가운데 정렬하기 위해 Center 위젯 사용
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 500),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
