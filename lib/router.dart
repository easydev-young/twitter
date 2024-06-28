import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/features/main_navigation/main_navigation_screen.dart';
import 'package:onboarding_flow_part1/features/settings/privacy_screen.dart';
import 'package:onboarding_flow_part1/features/settings/settings_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/:tab(|search|activity|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      path: SettingsScreen.routeURL,
      name: SettingsScreen.routeName,
      builder: (context, state) {
        return const SettingsScreen();
      },
      routes: [
        GoRoute(
          path: PrivacyScreen.routeURL,
          name: PrivacyScreen.routeName,
          builder: (context, state) {
            return const PrivacyScreen();
          },
        ),
      ],
    ),
  ],
);
