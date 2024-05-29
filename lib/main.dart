import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:project2_mobile/users/screens/my_home_page.dart';
import 'package:project2_mobile/users/screens/login_page.dart';
import 'package:project2_mobile/users/screens/sign_up_page.dart';
import 'package:project2_mobile/users/switchers/top_page_switcher.dart';

myColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF68548E),
    primaryContainer: Color(0xFFEBDDFF),
    onPrimary: Color(0xFFFFFFFF), // 使用済み
    onPrimaryContainer: Color(0xFF230F46),
    secondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE9DEF8),
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF1F182B),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFF1F182B),
    background: Color(0xFFFEF7FF), // 使用済み
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    surfaceTint: Color(0xFF68548E),
    onSurface: Color(0xFF1D1B20), // 使用済み
    onSurfaceVariant: Color(0xFF49454E),
    outlineVariant: Color(0xFFCBC4CF), // 使用済み
    outline: Color(0xFF7A757F),
  );
}

myTextTheme() {
  return const TextTheme(
    displayMedium: TextStyle(
      fontFamily: 'Roboto',  
      fontSize: 45.0, 
      letterSpacing: 0.0,
      height: 52.0 / 45.0,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',  // Figmaで確認したフォントファミリー
      fontSize: 16.0,  // Figmaで確認したフォントサイズ
      letterSpacing: 0.15,  // Figmaで確認した文字間隔
      height: 24.0 / 16.0,  // Figmaで確認した行の高さ
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',  
      fontSize: 16.0,
      letterSpacing: 0.5,
      height: 24.0 / 16.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',  // Figmaで確認したフォントファミリー
      fontSize: 14.0,  // Figmaで確認したフォントサイズ
      letterSpacing: 0.25,  // Figmaで確認した文字間隔
      height: 20.0 / 14.0,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Roboto',  
      fontSize: 14.0,
      letterSpacing: 0.1,
      height: 20.0 / 14.0,
    ),
  );
}


void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          colorScheme: myColorScheme(),
          textTheme: myTextTheme(),
        ),
      ),
    ),
  );
}

final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Top(),
      ),
      // GoRoute(
      //     path: '/sign_up',
      //     builder: (BuildContext context, GoRouterState state) => SignUpPage(),
      // ),
      // GoRoute(
      //   path: '/login',
      //   builder: (BuildContext context, GoRouterState state) => LoginPage(),
      // ),
      // GoRoute(
      //   path: '/my_home',
      //   builder: (BuildContext context, GoRouterState state) => const MyHomePage(),
      // )
    ],
  );


class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopPageSwitcher();
  }
}
