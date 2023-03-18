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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/Home/home.dart' as _i2;
import '../pages/Login/Login.dart' as _i1;
import '../pages/Project/project.dart' as _i3;
import 'guards.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter({
    _i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ProjectRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectRouteArgs>(
          orElse: () =>
              ProjectRouteArgs(projectId: pathParams.getString('projectId')));
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProjectPage(
          key: args.key,
          projectId: args.projectId,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        _i4.RouteConfig(
          ProjectRoute.name,
          path: '/project/:projectId',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ProjectPage]
class ProjectRoute extends _i4.PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    _i5.Key? key,
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

  final _i5.Key? key;

  final String projectId;

  @override
  String toString() {
    return 'ProjectRouteArgs{key: $key, projectId: $projectId}';
  }
}
