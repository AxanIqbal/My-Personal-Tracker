import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_personal_tracker/application/models/user/user.dart';

import '../../../core/utils/firebase_constants.dart';
import '../../models/milestones/milestone.dart';
import '../../models/project/project.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(this.uid) : super(User(projects: []));

  final String uid;

  void upgradeUser(User userUpgrade) {
    userUpgrade.projects.sort(
      (a, b) {
        int cmp = a.remaining.compareTo(b.remaining);
        if (cmp != 0) return cmp;
        return b.status.index.compareTo(a.status.index);
      },
    );

    for (var element in userUpgrade.projects) {
      element.milestones.sort(
        (a, b) => a.status.index.compareTo(b.status.index),
      );
    }

    state =
        userUpgrade.copyWith(projects: userUpgrade.projects.reversed.toList());
  }

  void addProjectMilestone(int index, Milestone milestone) {
    state.projects[index].milestones.add(milestone);
  }

  void removeProjectMilestone(int index, Milestone milestone) {
    state.projects[index].milestones.remove(milestone);
  }

  Future<void> toFirebase() {
    return usersProject.doc(uid).update(state.toJson());
  }

  void upgradeProjectMilestone(int index, int mIndex, Milestone milestone) {
    state.projects[index].milestones[mIndex] = milestone;
  }

  void updateProject(int index, Project project) {
    state.projects[index] = project;
  }
}
