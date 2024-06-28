import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';
import 'package:onboarding_flow_part1/models/thread.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  static String routeURL = "/profile";
  static String routeName = "profile";
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

void _onPressedSettings(BuildContext context) {
  context.push("/settings");
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<DisplayConfigViewModel>().darkMode;
    final List<Thread> threadList =
        threads.where((thread) => thread.isThread).toList();
    final List<Thread> replyList =
        threads.where((thread) => thread.isReply).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: isDark ? Colors.black : Colors.white,
        backgroundColor: isDark ? Colors.black : Colors.white,
        leading: const Icon(Icons.language),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_camera),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _onPressedSettings(context),
          ),
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1024,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: isDark ? Colors.black : Colors.white,
                    pinned: false,
                    expandedHeight: 220.0,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: FlexibleSpaceBar(
                        background: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Naya',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Gaps.v8,
                                    Row(
                                      children: [
                                        const Text(
                                          'naya_dev',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Gaps.h8,
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            'threads.net',
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage('assets/users/7.png'),
                                ),
                              ],
                            ),
                            Gaps.v8,
                            const Text(
                              'Mountaineering expert!',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Gaps.v16,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 40,
                                    height: 26,
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          backgroundImage:
                                              AssetImage('assets/users/1.png'),
                                        ),
                                        Positioned(
                                          left: 16,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundImage: AssetImage(
                                                'assets/users/2.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '2 followers',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Edit profile',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Share profile',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                        const TabBar(
                          //controller: _tabController,
                          tabs: [
                            Tab(text: 'Threads'),
                            Tab(text: 'Replies'),
                          ],
                        ),
                        isDark),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: threadList.length,
                            itemBuilder: (context, index) {
                              final thread = threadList[index];
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
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage:
                                                          AssetImage(thread
                                                              .profileImage),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SizedBox(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          thread.username,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                Sizes.size16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              thread.time,
                                                              style: TextStyle(
                                                                fontSize: Sizes
                                                                    .size16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                              ),
                                                            ),
                                                            Gaps.h12,
                                                            GestureDetector(
                                                              onTap: () => {},
                                                              child: const Icon(
                                                                FontAwesomeIcons
                                                                    .ellipsis,
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
                                                          thread.content,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                Sizes.size18,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Gaps.v8,
                                                  if (thread
                                                      .post.content.isNotEmpty)
                                                    Container(
                                                      width: 320,
                                                      height: 280,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade400),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  width: 20,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      width: 1,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      CircleAvatar(
                                                                        radius:
                                                                            9,
                                                                        backgroundImage: AssetImage(thread
                                                                            .post
                                                                            .profileImage),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Gaps.h5,
                                                                Text(
                                                                  thread.post
                                                                      .username,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize: Sizes
                                                                        .size15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                Gaps.h4,
                                                                if (thread.post
                                                                    .isVerified)
                                                                  const Icon(
                                                                    Icons
                                                                        .verified,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: Sizes
                                                                        .size16,
                                                                  ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              child: Text(
                                                                thread.post
                                                                    .content,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: Sizes
                                                                      .size16,
                                                                ),
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            if (thread
                                                                    .post
                                                                    .images
                                                                    .isEmpty ==
                                                                false)
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            Sizes.size16),
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                child:
                                                                    Image.asset(
                                                                  thread.post
                                                                      .images[0],
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  width: 270,
                                                                  height: 180,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  Gaps.v10,
                                                  const SizedBox(
                                                    height: 50,
                                                    width: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .heart,
                                                          size: Sizes.size20,
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .comment,
                                                          size: Sizes.size20,
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .arrowsRotate,
                                                          size: Sizes.size20,
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .paperPlane,
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
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
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: replyList.length,
                            itemBuilder: (context, index) {
                              final reply = replyList[index];
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
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage:
                                                          AssetImage(reply
                                                              .profileImage),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: VerticalDivider(
                                                      width: Sizes.size32,
                                                      thickness: 0.5,
                                                      color:
                                                          Colors.grey.shade600,
                                                      indent: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SizedBox(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          reply.username,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                Sizes.size16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              reply.time,
                                                              style: TextStyle(
                                                                fontSize: Sizes
                                                                    .size16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                              ),
                                                            ),
                                                            Gaps.h12,
                                                            GestureDetector(
                                                              onTap: () => {},
                                                              child: const Icon(
                                                                FontAwesomeIcons
                                                                    .ellipsis,
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
                                                          reply.content,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                Sizes.size18,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Gaps.v8,
                                                  if (reply
                                                      .post.content.isNotEmpty)
                                                    Container(
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade400),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  width: 20,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      width: 1,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      CircleAvatar(
                                                                        radius:
                                                                            9,
                                                                        backgroundImage: AssetImage(reply
                                                                            .post
                                                                            .profileImage),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Gaps.h5,
                                                                Text(
                                                                  reply.post
                                                                      .username,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize: Sizes
                                                                        .size15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                Gaps.h4,
                                                                if (reply.post
                                                                    .isVerified)
                                                                  const Icon(
                                                                    Icons
                                                                        .verified,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: Sizes
                                                                        .size16,
                                                                  ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              child: Text(
                                                                reply.post
                                                                    .content,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: Sizes
                                                                      .size16,
                                                                ),
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            if (reply
                                                                    .post
                                                                    .images
                                                                    .isEmpty ==
                                                                false)
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            Sizes.size16),
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                child:
                                                                    Image.asset(
                                                                  reply.post
                                                                      .images[0],
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  width: 270,
                                                                  height: 180,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  Gaps.v12,
                                                  const SizedBox(
                                                    height: 50,
                                                    width: 150,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .heart,
                                                          size: Sizes.size20,
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .comment,
                                                          size: Sizes.size20,
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .arrowsRotate,
                                                          size: Sizes.size20,
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .paperPlane,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(1),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        reply.reProfileImage),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        reply.reUsername,
                                                        style: const TextStyle(
                                                          fontSize:
                                                              Sizes.size16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            reply.reTime,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  Sizes.size16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors.grey
                                                                  .shade400,
                                                            ),
                                                          ),
                                                          Gaps.h12,
                                                          GestureDetector(
                                                            onTap: () => {},
                                                            child: const Icon(
                                                              FontAwesomeIcons
                                                                  .ellipsis,
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
                                                        reply.reContent,
                                                        style: const TextStyle(
                                                          fontSize:
                                                              Sizes.size18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Gaps.v8,
                                              ],
                                            ),
                                          ),
                                          Gaps.h8,
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  final bool isDark;

  _SliverAppBarDelegate(this._tabBar, this.isDark);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
