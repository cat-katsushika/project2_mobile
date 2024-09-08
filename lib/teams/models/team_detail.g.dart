// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamDetailImpl _$$TeamDetailImplFromJson(Map<String, dynamic> json) =>
    _$TeamDetailImpl(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
      continuationCount: json['continuation_count'] as int,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TeamDetailImplToJson(_$TeamDetailImpl instance) =>
    <String, dynamic>{
      'team': instance.team,
      'task': instance.task,
      'continuation_count': instance.continuationCount,
      'users': instance.users,
    };
