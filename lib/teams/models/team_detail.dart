import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project2_mobile/teams/models/team.dart';
import 'package:project2_mobile/teams/models/task.dart';
import 'package:project2_mobile/users/models/user.dart';

part 'team_detail.freezed.dart';
part 'team_detail.g.dart';


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