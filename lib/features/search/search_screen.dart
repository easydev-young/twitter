import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';
import 'package:onboarding_flow_part1/models/userDb.dart';
import 'package:onboarding_flow_part1/utils.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static String routeURL = "/search";
  static String routeName = "search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List<User> fakeUserData = users;

  void _onSearchChanged(String value) {
    _onSearchSubmitted(value);
  }

  void _onSearchSubmitted(String value) {
    setState(() {
      fakeUserData = users.where((user) {
        final searchLower = value.toLowerCase();
        final nicknameLower = user.nickname.toLowerCase();
        final usernameLower = user.username.toLowerCase();
        return nicknameLower.contains(searchLower) ||
            usernameLower.contains(searchLower);
      }).toList();
    });
  }

  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _toggleFollow(int index) {
    setState(() {
      fakeUserData[index] = fakeUserData[index]
          .copyWith(isFollowed: !fakeUserData[index].isFollowed);
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<DisplayConfigViewModel>().darkMode;

    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          surfaceTintColor: isDark ? Colors.black : Colors.white,
          toolbarHeight: 100,
          elevation: 1,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search',
                style: TextStyle(
                  fontSize: Sizes.size30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoSearchTextField(
                controller: _textEditingController,
                onChanged: _onSearchChanged,
                onSubmitted: _onSearchSubmitted,
                style: TextStyle(
                    color: isDarkMode(context) ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: fakeUserData.length,
          itemBuilder: (context, index) {
            final user = fakeUserData[index];

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
                    ],
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: user.nickname,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size17,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "\n${user.username}",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      user.isVerified
                          ? const Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 16,
                            )
                          : const SizedBox.square(),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v10,
                      Text(
                        user.followers,
                        style: const TextStyle(
                          fontSize: Sizes.size17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () => _toggleFollow(index),
                    child: Container(
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
                          user.isFollowed ? 'Following' : 'Follow',
                          style: TextStyle(
                            fontSize: Sizes.size17,
                            color:
                                user.isFollowed ? Colors.grey.shade400 : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  isThreeLine: true,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  thickness: 1,
                  indent: 72,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
