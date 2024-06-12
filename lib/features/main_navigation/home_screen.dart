import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/avatar_widget.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/replies_widget.dart';
import 'package:onboarding_flow_part1/models/posts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Padding(
                  padding: EdgeInsets.only(top: Sizes.size20), // 상단에 패딩 추가
                  child: Icon(
                    FontAwesomeIcons.threads,
                    size: Sizes.size36,
                  ),
                ),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: posts.length,
                  (BuildContext context, int index) {
                    final post = posts[index];
                    return Stack(
                      children: [
                        Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        AvatarWidget(post: post),
                                        Expanded(
                                          child: VerticalDivider(
                                            width: Sizes.size32,
                                            thickness: 0.5,
                                            color: Colors.grey.shade600,
                                            indent: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                post.username,
                                                style: const TextStyle(
                                                  fontSize: Sizes.size16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Gaps.h4,
                                              post.isVerified
                                                  ? const Icon(
                                                      Icons.verified,
                                                      color: Colors.blue,
                                                      size: Sizes.size16,
                                                    )
                                                  : const SizedBox.shrink(),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Text(
                                                    post.time,
                                                    style: const TextStyle(
                                                      fontSize: Sizes.size16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black26,
                                                    ),
                                                  ),
                                                  Gaps.h12,
                                                  GestureDetector(
                                                    onTap:
                                                        null, //() => _onTapMore(context),
                                                    child: const Icon(
                                                      FontAwesomeIcons.ellipsis,
                                                      size: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              // Flexible 위젯을 사용하여 텍스트를 감쌉니다.
                                              child: Text(
                                                post.content,
                                                style: const TextStyle(
                                                  fontSize: Sizes.size18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Gaps.v8,
                                        //이미지 게시물
                                        if (post.images.isEmpty == false)
                                          SizedBox(
                                            height: 200,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: post.images.length,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(width: 8),
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Sizes.size16),
                                                child: Image.asset(
                                                  post.images[index],
                                                  fit: BoxFit.fill,
                                                  width: 300,
                                                  height: 200,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Gaps.v12,
                                        const SizedBox(
                                          width: 150,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.heart,
                                                size: Sizes.size20,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.comment,
                                                size: Sizes.size20,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.arrowsRotate,
                                                size: Sizes.size20,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.paperPlane,
                                                size: Sizes.size20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gaps.h8,
                                ],
                              ),
                            ),
                            //리플리 이미지,..
                            RepliesWidget(post: post),
                            //게시물 구분 라인
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color: Colors.black12,
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
