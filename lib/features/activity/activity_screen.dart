import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';
import 'package:onboarding_flow_part1/models/activity.dart';
import 'package:onboarding_flow_part1/models/userDb.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  static String routeURL = "/activity";
  static String routeName = "activity";
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  List<User> fakeUserData = users;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: activityType.length,
      vsync: this,
    );
    tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<User> _getFilteredUsers(String tab) {
    if (tab == "All") return fakeUserData;
    if (tab == "Verified") {
      return fakeUserData.where((user) => user.isVerified).toList();
    }

    if (tab == "Replies") {
      return fakeUserData.where((user) => user.reply.isNotEmpty).toList();
    }

    if (tab == "Mentions") {
      return fakeUserData.where((user) => user.mention.isNotEmpty).toList();
    }

    return fakeUserData;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<DisplayConfigViewModel>().darkMode;

    return DefaultTabController(
      length: activityType.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          surfaceTintColor: isDark ? Colors.black : Colors.white,
          elevation: 1,
          title: const Text(
            'Activity',
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size30,
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: isDark ? Colors.black : Colors.white,
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                dividerHeight: 0,
                tabs: [
                  for (var tab in activityType)
                    Tab(
                      child: Container(
                        width: 120,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              tabController.index == activityType.indexOf(tab)
                                  ? (isDark ? Colors.white : Colors.black)
                                  : (isDark ? Colors.black : Colors.white),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            tab,
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: tabController.index ==
                                      activityType.indexOf(tab)
                                  ? (isDark ? Colors.black : Colors.white)
                                  : (isDark ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            for (var tab in activityType)
              ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: _getFilteredUsers(tab).length,
                itemBuilder: (context, index) {
                  final user = _getFilteredUsers(tab)[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(user.profileImage),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 16,
                                height: 16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: user.mention.isNotEmpty
                                      ? Colors.green
                                      : (user.reply.isNotEmpty
                                          ? Colors.blue
                                          : (user.isFollowed
                                              ? Colors.purple
                                              : Colors.pink)),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: user.mention.isNotEmpty
                                    ? const Icon(
                                        Icons.alternate_email,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    : (user.reply.isNotEmpty
                                        ? const FaIcon(
                                            FontAwesomeIcons.reply,
                                            size: 9,
                                            color: Colors.white,
                                          )
                                        : (user.isFollowed
                                            ? const FaIcon(
                                                FontAwesomeIcons.userAstronaut,
                                                size: 9,
                                                color: Colors.white,
                                              )
                                            : const FaIcon(
                                                FontAwesomeIcons.heart,
                                                size: 9,
                                                color: Colors.white,
                                              ))),
                              ),
                            ),
                          ],
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: user.nickname,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: " ${user.time}\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              TextSpan(
                                text: user.mention.isNotEmpty
                                    ? "Mentioned you"
                                    : (user.reply.isNotEmpty
                                        ? "replied to the post"
                                        : (user.hashtag.isNotEmpty
                                            ? user.hashtag
                                            : "sdsdsdsds")),

                                //r
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          user.mention.isNotEmpty
                              ? user.mention
                              : (user.reply.isNotEmpty
                                  ? user.reply
                                  : user.content),
                        ),
                        trailing: user.isFollowed
                            ? Container(
                                width: 120,
                                height: 37,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                        isThreeLine: true,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                        thickness: 1,
                        indent: 72, // Aligns with the avatar's right edge
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
