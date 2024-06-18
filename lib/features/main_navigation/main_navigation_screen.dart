import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/features/discover/discover_screen.dart';
import 'package:onboarding_flow_part1/features/inbox/activity_screen.dart';
import 'package:onboarding_flow_part1/features/main_navigation/new_thread_screen.dart';
import 'package:onboarding_flow_part1/features/main_navigation/profile.dart';
import 'package:onboarding_flow_part1/features/main_navigation/home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    if (index == 2) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const NewThreadScreen(),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const NewThreadScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Profile(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade500,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: _selectedIndex == 0
                  ? Colors.white
                  : (_selectedIndex == 1 ? Colors.black : Colors.grey),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.penToSquare,
              color: _selectedIndex == 0
                  ? Colors.white
                  : (_selectedIndex == 2 ? Colors.black : Colors.grey),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
              color: _selectedIndex == 0
                  ? Colors.white
                  : (_selectedIndex == 3 ? Colors.black : Colors.grey),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
              color: _selectedIndex == 0
                  ? Colors.white
                  : (_selectedIndex == 4 ? Colors.black : Colors.grey),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
