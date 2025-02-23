import 'package:flutter/material.dart';
import 'package:foodiego/views/pages/authentication/sign_in_page.dart';
import 'package:foodiego/views/pages/authentication/sign_up_page.dart';
import 'package:foodiego/views/pages/onboarding/onboarding_page.dart';
import 'package:foodiego/views/pages/onboarding/welcome_page.dart';
import 'package:foodiego/views/pages/orders/orders_page.dart';
import 'package:foodiego/views/pages/profile/profile_page.dart';
import 'package:go_router/go_router.dart';
import '../views/pages/home/home_page.dart';
import '../views/pages/layout_scaffold/layout_scaffold.dart';
import '../views/pages/search/search_page.dart';
import 'app_static_route_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppStaticRoutePaths.welcomeScreen,
    routes: [
      GoRoute(
        path: AppStaticRoutePaths.welcomeScreen,
        name: AppStaticRoutePaths.welcomeScreen,
        pageBuilder: (context, state) => MaterialPage(
          child: WelcomePage(),
        ),
      ),
      GoRoute(
        path: AppStaticRoutePaths.onBoardingPage,
        name: AppStaticRoutePaths.onBoardingPage,
        pageBuilder: (context, state) => MaterialPage(
          child: OnboardingPage(),
        ),
      ),
      GoRoute(
        path: AppStaticRoutePaths.signInPage,
        name: AppStaticRoutePaths.signInPage,
        pageBuilder: (context, state) => MaterialPage(
          child: SignInPage(),
        ),
      ),
      GoRoute(
        path: AppStaticRoutePaths.signUpPage,
        name: AppStaticRoutePaths.signUpPage,
        pageBuilder: (context, state) => MaterialPage(
          child: SignUpPage(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => LayoutScaffold(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppStaticRoutePaths.homePage,
                path: AppStaticRoutePaths.homePage,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppStaticRoutePaths.searchPage,
                path: AppStaticRoutePaths.searchPage,
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppStaticRoutePaths.ordersPage,
                path: AppStaticRoutePaths.ordersPage,
                builder: (context, state) => const OrdersPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppStaticRoutePaths.profilePage,
                name: AppStaticRoutePaths.profilePage,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ]);
