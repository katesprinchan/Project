import 'package:dex_course/feature/auth/presentation/widget/auth_page.dart';
import 'package:dex_course/feature/auth/presentation/widget/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouterList {
  static const loadingPage = '/';
  static const authPage = '/auth';
}

abstract class AppRouterConfig {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouterList.loadingPage,
        builder: (BuildContext context, GoRouterState state) {
          return const LoadingPage();
        },
      ),
      GoRoute(
        path: AppRouterList.authPage,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthPage();
        },
      ),
    ],
  );
}
