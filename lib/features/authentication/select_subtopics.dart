import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/models/interests.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';

class SelectSubtopics extends StatefulWidget {
  const SelectSubtopics({
    super.key,
    required this.userData,
    required this.selectedInterests,
  });

  final UserData userData;
  final List<String> selectedInterests;

  @override
  State<SelectSubtopics> createState() => _SelectSubtopicsState();
}

class _SelectSubtopicsState extends State<SelectSubtopics> {
  final List<String> selectedSubtopics = [];

  void _toggleSubtopic(String subtopic) {
    setState(() {
      if (selectedSubtopics.contains(subtopic)) {
        selectedSubtopics.remove(subtopic);
      } else {
        selectedSubtopics.add(subtopic);
      }
    });
  }

  void _onSubmitTap() {
    if (selectedSubtopics.length < 3) return;
  }

  void _cancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final selectedInterestsData = interests
        .where((interest) => widget.selectedInterests.contains(interest.title))
        .toList();

    return Scaffold(
      appBar: AppBarWidget(
        leadingType: LeadingType.back,
        onLeadingTap: () => _cancelTap(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Interests are used to personalize your experience and will be visible on your profile.",
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
              child: Divider(
                color: Colors.black12,
                thickness: 1.0,
              ),
            ),
            const SizedBox(height: Sizes.size10),
            Expanded(
              child: ListView.separated(
                itemCount: selectedInterestsData.length,
                itemBuilder: (context, index) {
                  final interest = selectedInterestsData[index];
                  final subInterests = interest.subtopics;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          interest.title,
                          style: const TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.v10,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 150,
                            width: 500,
                            child: Wrap(
                              spacing: Sizes.size8,
                              runSpacing: Sizes.size8,
                              children: subInterests.map((item) {
                                final isSelected =
                                    selectedSubtopics.contains(item);
                                return GestureDetector(
                                  onTap: () => _toggleSubtopic(item),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.black12,
                  );
                },
              ),
            ),
          ],
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
                    const SizedBox.shrink(),
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: selectedSubtopics.length >= 3
                                  ? _onSubmitTap
                                  : null,
                              child: SizedBox(
                                width: 310,
                                height: 50,
                                child: FormButton(
                                    disabled: selectedSubtopics.length < 3,
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
