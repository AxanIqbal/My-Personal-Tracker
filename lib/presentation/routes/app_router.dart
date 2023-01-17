import 'package:auto_route/auto_route.dart';

import '../pages/Home/Home.dart';
import '../pages/Login/Login.dart';
import 'guards.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: HomePage, path: "/", guards: [AuthGuard], initial: true),
  ],
)
class $AppRouter {}
