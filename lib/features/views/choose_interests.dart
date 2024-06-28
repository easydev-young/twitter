import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/interest_button.dart';
import 'package:onboarding_flow_part1/models/interests.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';
import 'package:onboarding_flow_part1/features/views/select_subtopics.dart';

class ChooseInterests extends StatefulWidget {
  const ChooseInterests({
    super.key,
    required this.userData,
  });

  final UserData userData;
  @override
  State<ChooseInterests> createState() => _ChooseInterestsState();
}

class _ChooseInterestsState extends State<ChooseInterests> {
  final List<String> selectedInterests = [];

  void _toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  void _onSubmitTap() {
    if (selectedInterests.length < 3) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectSubtopics(
          userData: widget.userData,
          selectedInterests: selectedInterests,
        ),
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
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 38,
                  right: 34,
                  bottom: Sizes.size16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gaps.v28,
                    Text(
                      "What do you want to see on Twitter?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v20,
                    Text(
                      "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Expanded(
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1.0,
                  ),
                ),
              ),
              Gaps.v16,
              Padding(
                padding: const EdgeInsets.only(
                  left: 1,
                  right: 1,
                  bottom: Sizes.size16,
                ),
                child: Column(
                  children: [
                    Wrap(
                      runSpacing: 15,
                      spacing: 15,
                      children: [
                        for (var interest in interests)
                          InterestButton(
                              interest: interest.title,
                              toggleInterest: _toggleInterest)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.white,
        height: 100,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                height: 1,
                color: Colors.black26, // 원하는 색상으로 설정
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: Sizes.size4,
                  top: Sizes.size1,
                  left: Sizes.size2,
                  right: Sizes.size2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "${selectedInterests.length} of 3 selected",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: selectedInterests.length >= 3
                                  ? _onSubmitTap
                                  : null,
                              child: SizedBox(
                                width: 310,
                                height: 50,
                                child: FormButton(
                                    disabled: selectedInterests.length < 3,
                                    buttonName: "Next"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
