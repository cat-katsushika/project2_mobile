import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';



@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String user,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}