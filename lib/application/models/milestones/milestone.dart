import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone.freezed.dart';
part 'milestone.g.dart';

enum MilestoneStatus {
  Pending,
  Complete,
  Lost,
}

@freezed
class Milestone with _$Milestone {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Milestone({
    int? id,
    required String name,
    required double cash,
    required DateTime createdAt,
    required DateTime updateAt,
    required MilestoneStatus status,
    int? projectId,
  }) = _Milestone;

  factory Milestone.fromJson(Map<String, dynamic> json) =>
      _$MilestoneFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class MilestoneChart with _$MilestoneChart {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory MilestoneChart({
    required DateTime uploadDate,
    required List<Milestone> milestones,
  }) = _MilestoneChart;

  factory MilestoneChart.fromJson(Map<String, dynamic> json) =>
      _$MilestoneChartFromJson(json);
}
