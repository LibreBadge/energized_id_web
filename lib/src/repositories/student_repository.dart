import 'dart:convert';

import 'package:energized_id/energized_id.dart';
import 'package:http/http.dart' as http;

class StudentRepository {
  http.Client _client;
  StudentRepository(this._client);

  Future<Student> getStudent(int id) async {
    var response = await _client.get("/students/$id");
    if (response.statusCode != 200) {
      throw "Student $id does not exist";
    }
    return Student.fromJson(jsonDecode(response.body));
  }

  Future<Student> putStudent(Student student, [int id]) async {
    var response = await _client.put("/students/${id ?? student.id}",
        body: jsonEncode(student.toJson()));
    if (response.statusCode != 200) {
      throw "Failed to save";
    }
    return Student.fromJson(jsonDecode(response.body));
  }

  Future<List<int>> getStudentImage(int id) async {
    var response = await _client.get("/students/$id/image");
    if (response.statusCode != 200) {
      throw "Failed to load image for student $id";
    }
    return response.bodyBytes;
  }

  Future<void> putStudentImage(List<int> imageData, int id) async {
    var response = await _client.put("/students/$id/image", body: imageData);
    if (response.statusCode != 204) {
      throw "Failed to upload image: ${response.body}";
    }
  }

  static Student get defaultStudent => Student()
    ..id = 1234567
    ..firstName = "John"
    ..lastName = "Doe"
    ..gradeLevel = 9;
}
