import 'package:supabase_flutter/supabase_flutter.dart';

import '../../application/models/user/user.dart' as user;

final supabase = Supabase.instance.client;

final profile =
    supabase.from("profiles").withConverter((data) => user.User.fromJson(data));
