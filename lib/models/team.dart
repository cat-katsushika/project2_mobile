import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';


@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    required String description,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String user,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class TeamDetail with _$TeamDetail {
  const factory TeamDetail({
    required Team team,
    required Task task,
    @JsonKey(name: 'continuation_count') required int continuationCount,
    required List<User> users,
  }) = _TeamDetail;

  factory TeamDetail.fromJson(Map<String, dynamic> json) => _$TeamDetailFromJson(json);
}