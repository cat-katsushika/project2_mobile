import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project2_mobile/settings/screens/settings_body.dart';

import 'package:project2_mobile/shared/widgets/scaffold_with_navigation_bar.dart';
import 'package:project2_mobile/teams/screens/my_team_list_body.dart';
import 'package:project2_mobile/teams/screens/team_detail_body.dart';
import 'package:project2_mobile/teams/screens/team_search_body.dart';
import 'package:project2_mobile/teams/screens/team_create_body.dart';
import 'package:project2_mobile/users/screens/initial_loading_scaffold.dart';
import 'package:project2_mobile/users/screens/login_scaffold.dart';
import 'package:project2_mobile/users/screens/sign_up_scaffold.dart';


final rootNabigatorKey = GlobalKey<NavigatorState>();
final homeNabigatorKey = GlobalKey<NavigatorState>();
final searchNabigatorKey = GlobalKey<NavigatorState>();
final settingsNabigatorKey = GlobalKey<NavigatorState>();


final appRouter = GoRouter(
  navigatorKey: rootNabigatorKey,
  initialLocation: '/initialLoading',
    routes: [
      GoRoute(
        path: '/initialLoading',
        builder: (context, state) => const InitialLoadingScaffold(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScaffold(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScaffold(),
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
            routes:[
              GoRoute(
                path: '/my_team_list',
                builder: (context, state) => const MyTeamListBody(),
              ),
              GoRoute(
                path: '/teams/:teamId',
                builder: (context, state) {
                  final teamId = state.pathParameters['teamId'] ?? ''; 
                  return TeamDetailBody(teamId: teamId);
                },
              )
            ],
          ),
          // Searchブランチ
          StatefulShellBranch(
            navigatorKey: searchNabigatorKey,
            routes:[
              GoRoute(
                path: '/search',
                builder: (context, state) => const TeamSearchBody(),
              ),
              GoRoute(
                path: '/create',
                builder: (context, state) => const TeamCreateBody(),
              )
            ],
          ),
          // Settingsブランチ
          StatefulShellBranch(
            navigatorKey: settingsNabigatorKey,
            routes:[
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsBody(),
              ),
            ],
          ),
        ]
      ),
    ],
  );