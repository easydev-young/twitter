import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/models/posts.dart';

class PostImagesWidget extends StatelessWidget {
  const PostImagesWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: post.images.length,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: Sizes.size6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size16),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              post.images[index],
              fit: BoxFit.fill,
              width: 300,
              height: 200,
            ),
          ),
        ),
        clipBehavior: Clip.none,
      ),
    );
  }
}
