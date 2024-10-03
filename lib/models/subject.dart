import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    String? name,
    List<String>? lecturers,
    String? code,
    String? group,
    String? time,
    String? place,
  }) = _Subject;

  factory Subject.fromJson(Map<String, Object?> json) =>
      _$SubjectFromJson(json);
}
