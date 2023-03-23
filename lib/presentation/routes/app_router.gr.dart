// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/Home/home.dart' as _i3;
import '../pages/Login/Login.dart' as _i1;
import '../pages/Project/project.dart' as _i4;
import '../pages/Signup/Signup.dart' as _i2;
import 'guards.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter({
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ProjectRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectRouteArgs>(
          orElse: () =>
              ProjectRouteArgs(projectId: pathParams.getString('projectId')));
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProjectPage(
          key: args.key,
          projectId: args.projectId,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          SignupRoute.name,
          path: '/signup',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i5.RouteConfig(
          ProjectRoute.name,
          path: '/project/:projectId',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SignupPage]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ProjectPage]
class ProjectRoute extends _i5.PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    _i6.Key? key,
    required String projectId,
  }) : super(
          ProjectRoute.name,
          path: '/project/:projectId',
          args: ProjectRouteArgs(
            key: key,
            projectId: projectId,
          ),
          rawPathParams: {'projectId': projectId},
        );

  static const String name = 'ProjectRoute';
}

class ProjectRouteArgs {
  const ProjectRouteArgs({
    this.key,
    required this.projectId,
  });

  final _i6.Key? key;

  final String projectId;

  @override
  String toString() {
    return 'ProjectRouteArgs{key: $key, projectId: $projectId}';
  }
}
