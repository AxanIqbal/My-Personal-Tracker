import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      resolver.next(true);
      // router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
    } else {
      router.pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
    }
  }
}
