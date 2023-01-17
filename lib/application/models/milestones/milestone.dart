import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone.freezed.dart';
part 'milestone.g.dart';

enum MilestoneStatus {
  Lost,
  Pending,
  Complete,
}

@freezed
class Milestone with _$Milestone {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Milestone({
    required String name,
    required double cash,
    required DateTime createdDate,
    required DateTime uploadDate,
    required MilestoneStatus status,
  }) = _Milestone;

  factory Milestone.fromJson(Map<String, dynamic> json) =>
      _$MilestoneFromJson(json);
}
