import 'package:flutter/material.dart';

import '../../application/models/milestones/milestone.dart';
import '../../application/models/project/project.dart';

final Map<MilestoneStatus, Color> milestoneColors = {
  MilestoneStatus.Complete: Colors.green,
  MilestoneStatus.Lost: Colors.red,
};

final Map<ProjectStatus, Color> projectColors = {
  ProjectStatus.OnGoing: Colors.black,
  ProjectStatus.Complete: Colors.green,
  ProjectStatus.Lost: Colors.red,
};
