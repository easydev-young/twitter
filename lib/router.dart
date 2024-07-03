import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow_part1/features/authentication/repos/authentication_repo.dart';
import 'package:onboarding_flow_part1/features/authentication/views/login_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/views/sign_up_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/views/welcome_screen.dart';
import 'package:onboarding_flow_part1/features/main_navigation/main_navigation_screen.dart';
import 'package:onboarding_flow_part1/features/settings/privacy_screen.dart';
import 'package:onboarding_flow_part1/features/settings/settings_screen.dart';

final routerProvider = Provider((ref) {
  ref.watch(authState);
  return GoRouter(
    initialLocation: "/",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return WelcomeScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: WelcomeScreen.routeName,
        path: WelcomeScreen.routeURL,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
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
});
