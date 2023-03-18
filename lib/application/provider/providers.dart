import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthState;

import '../../core/utils/supabase_constant.dart';
import '../models/project/project.dart';
import '../models/user/user.dart';

part 'providers.g.dart';

@riverpod
Stream<AuthState> userSupabaseStream(UserSupabaseStreamRef ref) =>
    supabase.auth.onAuthStateChange;

@riverpod
Future<User> userSupabase(UserSupabaseRef ref) => supabase
    .from("profiles")
    .select("*, projects:project(*, milestones:milestone(*))")
    .eq('id', supabase.auth.currentUser!.id)
    .single()
    .withConverter(
      (data) => User.fromJson(data),
    );

@riverpod
Future<Project> projectSupabase(ProjectSupabaseRef ref, String projectId) {
  return supabase
      .from("project")
      .select("*, milestones:milestone(*)")
      .eq('id', projectId)
      .single()
      .withConverter((data) => Project.fromJson(data));
}

// final userFirebaseProvider = StreamProvider(
//   (ref) {
//     final user = ref.watch(userFirebaseStreamProvider).asData;
//     final data = usersProject.doc(user?.value?.uid).snapshots();
//     return data;
//   },
// );
