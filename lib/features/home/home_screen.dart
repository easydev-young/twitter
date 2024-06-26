import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/avatar_widget.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/post_Images_widget.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/more_bottom_sheet.dart';
import 'package:onboarding_flow_part1/features/main_navigation/widgets/replies_widget.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';
import 'package:onboarding_flow_part1/models/posts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeURL = "/";
  static String routeName = "home";
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  _onTapMore(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const MoreBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(displayConfigProvider).darkMode;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: isDark ? Colors.black : Colors.white,
                title: const Padding(
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
                                            color: Colors.grey.shade400,
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
                                                style: TextStyle(
                                                  fontSize: Sizes.size16,
                                                  fontWeight: FontWeight.w500,
                                                  color: isDark
                                                      ? null
                                                      : Colors.black,
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
                                                    style: TextStyle(
                                                      fontSize: Sizes.size16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                  Gaps.h12,
                                                  GestureDetector(
                                                    onTap: () =>
                                                        _onTapMore(context),
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
                                          PostImagesWidget(post: post),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color: Colors.grey.shade400,
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
