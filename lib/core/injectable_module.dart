import 'package:injectable/injectable.dart';

import '../presentation/routes/app_router.gr.dart';
import '../presentation/routes/guards.dart';

@module
abstract class InjectableModule {
  @singleton
  AppRouter get appRouter => AppRouter(authGuard: AuthGuard());
}
