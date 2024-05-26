// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeamDetail _$TeamDetailFromJson(Map<String, dynamic> json) {
  return _TeamDetail.fromJson(json);
}

/// @nodoc
mixin _$TeamDetail {
  Team get team => throw _privateConstructorUsedError;
  Task get task => throw _privateConstructorUsedError;
  @JsonKey(name: 'continuation_count')
  int get continuationCount => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamDetailCopyWith<TeamDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamDetailCopyWith<$Res> {
  factory $TeamDetailCopyWith(
          TeamDetail value, $Res Function(TeamDetail) then) =
      _$TeamDetailCopyWithImpl<$Res, TeamDetail>;
  @useResult
  $Res call(
      {Team team,
      Task task,
      @JsonKey(name: 'continuation_count') int continuationCount,
      List<User> users});

  $TeamCopyWith<$Res> get team;
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$TeamDetailCopyWithImpl<$Res, $Val extends TeamDetail>
    implements $TeamDetailCopyWith<$Res> {
  _$TeamDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? task = null,
    Object? continuationCount = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      continuationCount: null == continuationCount
          ? _value.continuationCount
          : continuationCount // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamDetailImplCopyWith<$Res>
    implements $TeamDetailCopyWith<$Res> {
  factory _$$TeamDetailImplCopyWith(
          _$TeamDetailImpl value, $Res Function(_$TeamDetailImpl) then) =
      __$$TeamDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Team team,
      Task task,
      @JsonKey(name: 'continuation_count') int continuationCount,
      List<User> users});

  @override
  $TeamCopyWith<$Res> get team;
  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$TeamDetailImplCopyWithImpl<$Res>
    extends _$TeamDetailCopyWithImpl<$Res, _$TeamDetailImpl>
    implements _$$TeamDetailImplCopyWith<$Res> {
  __$$TeamDetailImplCopyWithImpl(
      _$TeamDetailImpl _value, $Res Function(_$TeamDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? task = null,
    Object? continuationCount = null,
    Object? users = null,
  }) {
    return _then(_$TeamDetailImpl(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      continuationCount: null == continuationCount
          ? _value.continuationCount
          : continuationCount // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamDetailImpl implements _TeamDetail {
  const _$TeamDetailImpl(
      {required this.team,
      required this.task,
      @JsonKey(name: 'continuation_count') required this.continuationCount,
      required final List<User> users})
      : _users = users;

  factory _$TeamDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamDetailImplFromJson(json);

  @override
  final Team team;
  @override
  final Task task;
  @override
  @JsonKey(name: 'continuation_count')
  final int continuationCount;
  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'TeamDetail(team: $team, task: $task, continuationCount: $continuationCount, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamDetailImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.continuationCount, continuationCount) ||
                other.continuationCount == continuationCount) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, team, task, continuationCount,
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamDetailImplCopyWith<_$TeamDetailImpl> get copyWith =>
      __$$TeamDetailImplCopyWithImpl<_$TeamDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamDetailImplToJson(
      this,
    );
  }
}

abstract class _TeamDetail implements TeamDetail {
  const factory _TeamDetail(
      {required final Team team,
      required final Task task,
      @JsonKey(name: 'continuation_count') required final int continuationCount,
      required final List<User> users}) = _$TeamDetailImpl;

  factory _TeamDetail.fromJson(Map<String, dynamic> json) =
      _$TeamDetailImpl.fromJson;

  @override
  Team get team;
  @override
  Task get task;
  @override
  @JsonKey(name: 'continuation_count')
  int get continuationCount;
  @override
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$TeamDetailImplCopyWith<_$TeamDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
