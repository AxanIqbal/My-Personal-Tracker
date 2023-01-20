import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/app.dart';
import 'injection.dart';
import 'supabase_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseURL,
    anonKey: supabaseAnon,
  );

  configureDependencies();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
