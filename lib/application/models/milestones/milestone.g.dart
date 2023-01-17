// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Milestone _$$_MilestoneFromJson(Map<String, dynamic> json) => _$_Milestone(
      name: json['name'] as String,
      cash: (json['cash'] as num).toDouble(),
      createdDate: DateTime.parse(json['created_date'] as String),
      uploadDate: DateTime.parse(json['upload_date'] as String),
      status: $enumDecode(_$MilestoneStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_MilestoneToJson(_$_Milestone instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cash': instance.cash,
      'created_date': instance.createdDate.toIso8601String(),
      'upload_date': instance.uploadDate.toIso8601String(),
      'status': _$MilestoneStatusEnumMap[instance.status]!,
    };

const _$MilestoneStatusEnumMap = {
  MilestoneStatus.Lost: 'Lost',
  MilestoneStatus.Pending: 'Pending',
  MilestoneStatus.Complete: 'Complete',
};
