// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      name: json['name'] as String,
      milestones: (json['milestones'] as List<dynamic>)
          .map((e) => Milestone.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'name': instance.name,
      'milestones': instance.milestones.map((e) => e.toJson()).toList(),
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.Complete: 'Complete',
  ProjectStatus.OnGoing: 'OnGoing',
  ProjectStatus.Lost: 'Lost',
};
