import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/models/posts.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(post.profileImage),
          ),
        ),
        Positioned(
          bottom: -1,
          right: -2,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              radius: 10,
              child: Icon(
                FontAwesomeIcons.plus,
                size: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
