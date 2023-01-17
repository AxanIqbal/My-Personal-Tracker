import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/models/user/user.dart'
    as my_user;

import '../../core/utils/firebase_constants.dart';
import 'user/user_notifier.dart';

final userFirebaseStreamProvider = StreamProvider(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);

final userNotifierProvider = Provider(
  (ref) => UserNotifier(
    ref.watch(userFirebaseStreamProvider).asData?.value?.uid ?? "",
    ref.watch(userFirebaseProvider).asData?.value.data() ??
        my_user.User(projects: []),
  ),
);

final userFirebaseProvider = StreamProvider(
  (ref) {
    final user = ref.watch(userFirebaseStreamProvider).asData;
    return usersProject.doc(user?.value?.uid).snapshots();
  },
);
