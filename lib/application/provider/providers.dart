import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/models/user/user.dart'
    as my_user;

import 'user/user_notifier.dart';

final userFirebaseStreamProvider = StreamProvider(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);

final userNotifierProvider = StateNotifierProvider<UserNotifier, my_user.User>(
  (ref) => UserNotifier(
    ref.watch(userFirebaseStreamProvider).asData?.value?.uid ?? "",
  ),
);

// final userFirebaseProvider = StreamProvider(
//   (ref) {
//     final user = ref.watch(userFirebaseStreamProvider).asData;
//     final data = usersProject.doc(user?.value?.uid).snapshots();
//     return data;
//   },
// );
