import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/supabase_constant.dart';
import '../models/user/user.dart';
import 'user/user_notifier.dart';

final userSupabaseStreamProvider = StreamProvider(
  (ref) => supabase.auth.onAuthStateChange,
);

final userNotifierProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    ref.watch(userSupabaseStreamProvider).asData?.value.session?.user.id ?? "",
  ),
);

final userSupabaseProvider = FutureProvider.autoDispose(
  (ref) => supabase
      .from("profiles")
      .select("*, projects:project(*, milestones:milestone(*))")
      .eq('id', supabase.auth.currentUser!.id)
      .single()
      .withConverter(
        (data) => User.fromJson(data),
      ),
);

// final userFirebaseProvider = StreamProvider(
//   (ref) {
//     final user = ref.watch(userFirebaseStreamProvider).asData;
//     final data = usersProject.doc(user?.value?.uid).snapshots();
//     return data;
//   },
// );
