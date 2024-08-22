import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project2_mobile/shared/widgets/scaffold_with_navigation_bar.dart';
import 'package:project2_mobile/main.dart';
import 'package:project2_mobile/users/screens/login_page.dart';
import 'package:project2_mobile/users/screens/sign_up_page.dart';


final rootNabigatorKey = GlobalKey<NavigatorState>();
final homeNabigatorKey = GlobalKey<NavigatorState>();
final searchNabigatorKey = GlobalKey<NavigatorState>();
final settingsNabigatorKey = GlobalKey<NavigatorState>();


final appRouter = GoRouter(
  navigatorKey: rootNabigatorKey,
  initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Top(),
      ),
      GoRoute(
        path: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNabigatorKey,
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          // Homeブランチ
          StatefulShellBranch(
            navigatorKey: homeNabigatorKey,
            routes:[],
          ),
          // Searchブランチ
          StatefulShellBranch(
            navigatorKey: searchNabigatorKey,
            routes:[],
          ),
          // Settingsブランチ
          StatefulShellBranch(
            navigatorKey: settingsNabigatorKey,
            routes:[],
          ),
        ]
      ),
    ],
  );