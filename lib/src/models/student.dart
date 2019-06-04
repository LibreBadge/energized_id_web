import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

mixin StudentRecord {
  int id;
  String firstName;
  String lastName;
  int gradeLevel;
  DateTime lastPrinted;
}

@JsonSerializable()
class Student with StudentRecord {
  Student();
  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
