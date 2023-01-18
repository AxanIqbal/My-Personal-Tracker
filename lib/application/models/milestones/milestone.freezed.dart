// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Milestone _$MilestoneFromJson(Map<String, dynamic> json) {
  return _Milestone.fromJson(json);
}

/// @nodoc
mixin _$Milestone {
  String get name => throw _privateConstructorUsedError;
  double get cash => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  DateTime get uploadDate => throw _privateConstructorUsedError;
  MilestoneStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MilestoneCopyWith<Milestone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilestoneCopyWith<$Res> {
  factory $MilestoneCopyWith(Milestone value, $Res Function(Milestone) then) =
      _$MilestoneCopyWithImpl<$Res, Milestone>;
  @useResult
  $Res call(
      {String name,
      double cash,
      DateTime createdDate,
      DateTime uploadDate,
      MilestoneStatus status});
}

/// @nodoc
class _$MilestoneCopyWithImpl<$Res, $Val extends Milestone>
    implements $MilestoneCopyWith<$Res> {
  _$MilestoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cash = null,
    Object? createdDate = null,
    Object? uploadDate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cash: null == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as double,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MilestoneStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MilestoneCopyWith<$Res> implements $MilestoneCopyWith<$Res> {
  factory _$$_MilestoneCopyWith(
          _$_Milestone value, $Res Function(_$_Milestone) then) =
      __$$_MilestoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double cash,
      DateTime createdDate,
      DateTime uploadDate,
      MilestoneStatus status});
}

/// @nodoc
class __$$_MilestoneCopyWithImpl<$Res>
    extends _$MilestoneCopyWithImpl<$Res, _$_Milestone>
    implements _$$_MilestoneCopyWith<$Res> {
  __$$_MilestoneCopyWithImpl(
      _$_Milestone _value, $Res Function(_$_Milestone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cash = null,
    Object? createdDate = null,
    Object? uploadDate = null,
    Object? status = null,
  }) {
    return _then(_$_Milestone(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cash: null == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as double,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MilestoneStatus,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Milestone implements _Milestone {
  const _$_Milestone(
      {required this.name,
      required this.cash,
      required this.createdDate,
      required this.uploadDate,
      required this.status});

  factory _$_Milestone.fromJson(Map<String, dynamic> json) =>
      _$$_MilestoneFromJson(json);

  @override
  final String name;
  @override
  final double cash;
  @override
  final DateTime createdDate;
  @override
  final DateTime uploadDate;
  @override
  final MilestoneStatus status;

  @override
  String toString() {
    return 'Milestone(name: $name, cash: $cash, createdDate: $createdDate, uploadDate: $uploadDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Milestone &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cash, cash) || other.cash == cash) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, cash, createdDate, uploadDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MilestoneCopyWith<_$_Milestone> get copyWith =>
      __$$_MilestoneCopyWithImpl<_$_Milestone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MilestoneToJson(
      this,
    );
  }
}

abstract class _Milestone implements Milestone {
  const factory _Milestone(
      {required final String name,
      required final double cash,
      required final DateTime createdDate,
      required final DateTime uploadDate,
      required final MilestoneStatus status}) = _$_Milestone;

  factory _Milestone.fromJson(Map<String, dynamic> json) =
      _$_Milestone.fromJson;

  @override
  String get name;
  @override
  double get cash;
  @override
  DateTime get createdDate;
  @override
  DateTime get uploadDate;
  @override
  MilestoneStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MilestoneCopyWith<_$_Milestone> get copyWith =>
      throw _privateConstructorUsedError;
}

MilestoneChart _$MilestoneChartFromJson(Map<String, dynamic> json) {
  return _MilestoneChart.fromJson(json);
}

/// @nodoc
mixin _$MilestoneChart {
  DateTime get uploadDate => throw _privateConstructorUsedError;
  List<Milestone> get milestones => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MilestoneChartCopyWith<MilestoneChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilestoneChartCopyWith<$Res> {
  factory $MilestoneChartCopyWith(
          MilestoneChart value, $Res Function(MilestoneChart) then) =
      _$MilestoneChartCopyWithImpl<$Res, MilestoneChart>;
  @useResult
  $Res call({DateTime uploadDate, List<Milestone> milestones});
}

/// @nodoc
class _$MilestoneChartCopyWithImpl<$Res, $Val extends MilestoneChart>
    implements $MilestoneChartCopyWith<$Res> {
  _$MilestoneChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadDate = null,
    Object? milestones = null,
  }) {
    return _then(_value.copyWith(
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      milestones: null == milestones
          ? _value.milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<Milestone>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MilestoneChartCopyWith<$Res>
    implements $MilestoneChartCopyWith<$Res> {
  factory _$$_MilestoneChartCopyWith(
          _$_MilestoneChart value, $Res Function(_$_MilestoneChart) then) =
      __$$_MilestoneChartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime uploadDate, List<Milestone> milestones});
}

/// @nodoc
class __$$_MilestoneChartCopyWithImpl<$Res>
    extends _$MilestoneChartCopyWithImpl<$Res, _$_MilestoneChart>
    implements _$$_MilestoneChartCopyWith<$Res> {
  __$$_MilestoneChartCopyWithImpl(
      _$_MilestoneChart _value, $Res Function(_$_MilestoneChart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadDate = null,
    Object? milestones = null,
  }) {
    return _then(_$_MilestoneChart(
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      milestones: null == milestones
          ? _value.milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<Milestone>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MilestoneChart implements _MilestoneChart {
  _$_MilestoneChart({required this.uploadDate, required this.milestones});

  factory _$_MilestoneChart.fromJson(Map<String, dynamic> json) =>
      _$$_MilestoneChartFromJson(json);

  @override
  final DateTime uploadDate;
  @override
  final List<Milestone> milestones;

  @override
  String toString() {
    return 'MilestoneChart(uploadDate: $uploadDate, milestones: $milestones)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MilestoneChart &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            const DeepCollectionEquality()
                .equals(other.milestones, milestones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uploadDate, const DeepCollectionEquality().hash(milestones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MilestoneChartCopyWith<_$_MilestoneChart> get copyWith =>
      __$$_MilestoneChartCopyWithImpl<_$_MilestoneChart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MilestoneChartToJson(
      this,
    );
  }
}

abstract class _MilestoneChart implements MilestoneChart {
  factory _MilestoneChart(
      {required final DateTime uploadDate,
      required final List<Milestone> milestones}) = _$_MilestoneChart;

  factory _MilestoneChart.fromJson(Map<String, dynamic> json) =
      _$_MilestoneChart.fromJson;

  @override
  DateTime get uploadDate;
  @override
  List<Milestone> get milestones;
  @override
  @JsonKey(ignore: true)
  _$$_MilestoneChartCopyWith<_$_MilestoneChart> get copyWith =>
      throw _privateConstructorUsedError;
}
