// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['id'] as int?,
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      milestones: (json['milestones'] as List<dynamic>)
          .map((e) => Milestone.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'milestones': instance.milestones.map((e) => e.toJson()).toList(),
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.OnGoing: 'OnGoing',
  ProjectStatus.Complete: 'Complete',
  ProjectStatus.Lost: 'Lost',
};
