import 'package:auto_route/auto_route.dart';
import 'package:my_personal_tracker/presentation/pages/Signup/Signup.dart';

import '../pages/Home/home.dart';
import '../pages/Login/Login.dart';
import '../pages/Project/project.dart';
import 'guards.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: SignupPage, path: "/signup"),
    AutoRoute(page: HomePage, path: "/", guards: [AuthGuard], initial: true),
    AutoRoute(
        page: ProjectPage, path: "/project/:projectId", guards: [AuthGuard]),
  ],
)
class $AppRouter {}
