import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<String> reports = [
      'I just don’t like it',
      'It’s unlawful content under NetzDG',
      'It’s spam',
      'Hate speech or symbols',
      'Nudity or sexual activity',
      'I just hate it'
    ];

    return Container(
      height: size.height * 0.6,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Gaps.v14,
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(Sizes.size3),
                ),
              ),
              Gaps.v20,
              const Text(
                'Report',
                style: TextStyle(
                    fontSize: Sizes.size20, fontWeight: FontWeight.w600),
              ),
              Gaps.v16,
              Divider(
                color: Colors.grey.shade300.withOpacity(0.7),
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v8,
                    const Text(
                      'Why are you reporting this thread?',
                      style: TextStyle(
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v8,
                    Text(
                      'Your report is anonymous, except if you’re reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don’t wait.',
                      style: TextStyle(
                        fontSize: Sizes.size15,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v16,
              Divider(
                color: Colors.grey.shade300.withOpacity(0.7),
                height: 1,
                thickness: 1,
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size20,
                  ),
                  separatorBuilder: (context, index) => Column(
                    children: [
                      Gaps.v20,
                      Divider(
                        color: Colors.grey.shade300.withOpacity(0.7),
                        height: 1,
                        thickness: 1,
                      ),
                      Gaps.v20,
                    ],
                  ),
                  itemCount: reports.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reports[index],
                          style: const TextStyle(
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: Sizes.size18, color: Colors.black54),
                      ],
                    ),
                  ),
                ),
              ),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
  }
}
