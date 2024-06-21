import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Privacy',
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
              ),
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
              Icons.lock_rounded,
              size: Sizes.size32,
            ),
            title: Text(
              'Private profile',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
                color: _isPrivateProfile ? Colors.black : Colors.grey,
              ),
            ),
            trailing: Switch(
              value: _isPrivateProfile,
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey.shade300,
              onChanged: (bool value) {
                setState(() {
                  _isPrivateProfile = value;
                });
              },
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.alternate_email_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              'Mentions',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Everyone',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_off_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              'Muted',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.visibility_off_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              'Hidden Words',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.people_alt_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              'Profiles you follow',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {},
          ),
          const Divider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Other privacy settings',
                      style: TextStyle(
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.open_in_new, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
                    style: TextStyle(
                      fontSize: Sizes.size17,
                      color: Colors.grey.shade500,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.highlight_off_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              'Blocked profiles',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.open_in_new, color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.heart_broken_outlined,
              size: Sizes.size32,
            ),
            title: const Text(
              'Hide likes',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.open_in_new, color: Colors.grey),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
