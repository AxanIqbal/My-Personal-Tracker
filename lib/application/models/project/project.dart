import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_personal_tracker/application/models/milestones/milestone.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectStatus {
  Complete,
  OnGoing,
  Lost,
}

@Freezed(makeCollectionsUnmodifiable: false)
class Project with _$Project {
  Project._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory Project({
    required ProjectStatus status,
    required String name,
    required List<Milestone> milestones,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  double get total =>
      milestones.map((e) => e.cash).reduce((value, element) => value + element);

  double get earned => milestones
      .map((e) => e.status == MilestoneStatus.Complete ? e.cash : 0.0)
      .reduce((value, element) => value + element);

  double get remaining => milestones
      .map((e) => e.status == MilestoneStatus.Pending ? e.cash : 0.0)
      .reduce((value, element) => value + element);
}
