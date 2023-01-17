import 'package:freezed_annotation/freezed_annotation.dart';

import '../project/project.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class User with _$User {
  User._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory User({
    required List<Project> projects,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
