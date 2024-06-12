import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/features/main_navigation/add_screen.dart';
import 'package:onboarding_flow_part1/features/main_navigation/notifications.dart';
import 'package:onboarding_flow_part1/features/main_navigation/profile.dart';
import 'package:onboarding_flow_part1/features/main_navigation/search_screen.dart';
import 'package:onboarding_flow_part1/features/main_navigation/home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white, // 상태 바 배경 색상을 흰색으로 설정
    //   statusBarIconBrightness:
    //       Brightness.dark, // 상태 바 아이콘 색상을 어둡게 설정 (흰색 배경에 잘 보이도록)
    // ));

    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const AddScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Notifications(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Profile(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade500,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.penToSquare),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
