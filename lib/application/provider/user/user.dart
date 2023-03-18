import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/project/project.dart';
import '../../models/user/user.dart';

part 'user.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User? build() {
    return null;
  }

  void setUser(User user) {
    state = user;
  }

  Project? getProject(String id) {
    return state?.projects.firstWhere((element) => element.id.toString() == id);
  }
}
