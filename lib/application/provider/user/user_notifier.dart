import 'package:my_personal_tracker/application/models/user/user.dart';

import '../../../core/utils/firebase_constants.dart';
import '../../models/milestones/milestone.dart';

class UserNotifier {
  UserNotifier(this.uid, this.user) : super();

  final String uid;
  User user;

  void upgrade(User userUpgrade) {
    print("upgrade user");
    user = userUpgrade;
  }

  void addProjectMilestone(int index, Milestone milestone) {
    user.projects[index].milestones.add(milestone);
  }

  void removeProjectMilestone(int index, Milestone milestone) {
    user.projects[index].milestones.remove(milestone);
  }

  Future<void> toFirebase() {
    return usersProject.doc(uid).update(user.toJson());
  }

  void upgradeProjectMilestone(int index, int mIndex, Milestone milestone) {
    user.projects[index].milestones[mIndex] = milestone;
  }
}
