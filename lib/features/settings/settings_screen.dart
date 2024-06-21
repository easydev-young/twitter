import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/settings/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoggingOut = false;
  bool _isLoggingOutiOS = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapPrivacy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrivacyScreen(),
      ),
    );
  }

  Future<void> _handleLogoutiOS(BuildContext context) async {
    setState(() {
      _isLoggingOutiOS = true;
    });
    Navigator.of(context).pop();
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoggingOutiOS = false;
    });
  }

  Future<void> _handleLogoutAndroid(BuildContext context) async {
    setState(() {
      _isLoggingOut = true;
    });
    Navigator.of(context).pop();
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _isLoggingOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ), // Add some space between the icon and text
              Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.person_add_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              "Follow and invite friends",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.lock_rounded,
              size: Sizes.size32,
            ),
            title: const Text(
              "Privacy",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => _onTapPrivacy(context),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              "Account",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.support_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              "Help",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              "About",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Log out (iOS)",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                if (_isLoggingOutiOS)
                  RotationTransition(
                    turns: _controller,
                    child: Icon(
                      FontAwesomeIcons.spinner,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                  ),
              ],
            ),
            textColor: Colors.blue,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you really going?"),
                  content: const Text("If you can, don't go."),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => _handleLogoutiOS(context),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Log out (Android)",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                if (_isLoggingOut)
                  RotationTransition(
                    turns: _controller,
                    child: Icon(
                      FontAwesomeIcons.spinner,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                  ),
              ],
            ),
            textColor: Colors.blue,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are you really going?"),
                  content: const Text("If you can, don't go."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () => _handleLogoutAndroid(context),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}