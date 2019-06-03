import 'dart:convert';

import 'package:energized_id/energized_id.dart';
import 'package:http/http.dart' as http;

class IdServer {
  http.Client _client;
  IdServer(this._client);

  Future<Student> getStudent(int id) async {
    var response = await _client.get("/students/$id");
    if (response.statusCode != 200) {
      throw "Student $id does not exist";
    }
    return Student.fromJson(jsonDecode(response.body));
  }

  Future<Student> postStudent(Student student, [int id]) async {
    var response = await _client.post("/students/${id ?? student.id}",
        body: jsonEncode(student.toJson()));
    if (response.statusCode != 200) {
      throw "Failed to save";
    }
    return Student.fromJson(jsonDecode(response.body));
  }

  Future<List<int>> getStudentImage(int id) async {}

  Future<void> postStudentImage(List<int> imageData, int id) async {}

  Student get _defaultStudent => Student()
    ..firstName = "John"
    ..lastName = "Doe"
    ..gradeLevel = 9;
}
