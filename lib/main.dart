import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/settings/repos/display_config_repo.dart';
import 'package:onboarding_flow_part1/features/settings/view_models/display_config_vm.dart';
import 'package:onboarding_flow_part1/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:onboarding_flow_part1/views/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  final preferences = await SharedPreferences.getInstance();
  final repository = DisplayConfigRepository(preferences);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DisplayConfigViewModel(repository),
      )
    ],
    child: const TikTokApp(),
  ));
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<DisplayConfigViewModel>().darkMode;
    return MaterialApp.router(
      routerConfig: router,
      // debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.white,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
      //home: const SignUpScreen(),
      //home: const MainNavigationScreen(),
      //home: const VideoRecordingScreen(),
    );
  }
}
