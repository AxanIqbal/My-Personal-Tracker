// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Milestone _$$_MilestoneFromJson(Map<String, dynamic> json) => _$_Milestone(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cash: (json['cash'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updateAt: DateTime.parse(json['update_at'] as String),
      status: $enumDecode(_$MilestoneStatusEnumMap, json['status']),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      projectId: json['project_id'] as int?,
    );

Map<String, dynamic> _$$_MilestoneToJson(_$_Milestone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cash': instance.cash,
      'created_at': instance.createdAt.toIso8601String(),
      'update_at': instance.updateAt.toIso8601String(),
      'status': _$MilestoneStatusEnumMap[instance.status]!,
      'features': instance.features,
      'project_id': instance.projectId,
    };

const _$MilestoneStatusEnumMap = {
  MilestoneStatus.Pending: 'Pending',
  MilestoneStatus.Complete: 'Complete',
  MilestoneStatus.Lost: 'Lost',
};

_$_MilestoneChart _$$_MilestoneChartFromJson(Map<String, dynamic> json) =>
    _$_MilestoneChart(
      uploadDate: DateTime.parse(json['upload_date'] as String),
      milestones: (json['milestones'] as List<dynamic>)
          .map((e) => Milestone.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MilestoneChartToJson(_$_MilestoneChart instance) =>
    <String, dynamic>{
      'upload_date': instance.uploadDate.toIso8601String(),
      'milestones': instance.milestones.map((e) => e.toJson()).toList(),
    };
