import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/provider/providers.dart';

import '../injection.dart';
import '../presentation/routes/app_router.gr.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return Consumer(builder: (context, ref, child) {
      ref.listen(userSupabaseStreamProvider, (previous, next) {
        next.maybeWhen(
          orElse: () {},
          data: (data) {
            if (data.session == null &&
                appRouter.currentPath != const LoginRoute().path) {
              return appRouter.pushAndPopUntil(
                const LoginRoute(),
                predicate: (route) => false,
              );
            } else if (appRouter.currentPath != const HomeRoute().path) {
              return appRouter.pushAndPopUntil(
                const HomeRoute(),
                predicate: (route) => false,
              );
            }
          },
        );
      });

      return MaterialApp.router(
        title: "My Personal Tracker",
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            errorColor: Colors.red,
          ),
          dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        routeInformationProvider: appRouter.routeInfoProvider(),
      );
    });
  }
}
