import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';
import 'package:onboarding_flow_part1/models/posts.dart';
import 'package:onboarding_flow_part1/utils.dart';
import 'package:provider/provider.dart';

class RepliesWidget extends StatelessWidget {
  const RepliesWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 45,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (post.replies == 1)
                  Positioned(
                    bottom: 8,
                    left: 9,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(post.repliers[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                if (post.replies == 2) ...[
                  Positioned(
                    bottom: 10,
                    left: 3,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(post.repliers[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 0,
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage(post.repliers[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
                if (post.replies >= 3) ...[
                  Positioned(
                    bottom: 12,
                    left: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(post.repliers[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 18,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(post.repliers[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 24,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(post.repliers[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Gaps.h8,
          Text(
            '${post.replies} ${post.replies > 1 ? 'replies' : 'reply'} · ${post.likes} likes',
            style: TextStyle(
              fontSize: Sizes.size16,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
