import 'package:energized_id/energized_id.dart';
import 'package:http/http.dart' as http;

import 'student_repository.dart';

class MockStudentRepository implements StudentRepository {
  http.Client _client;
  MockStudentRepository(this._client);

  var kai = Student()
    ..id = 1540120
    ..firstName = "Kai"
    ..lastName = "Page"
    ..gradeLevel = 12;

  List<int> kaiPicture;

  @override
  Future<Student> getStudent(int id) {
    if (id != 1540120) throw "Mock server only works with Kai";
    return Future.value(kai);
  }

  @override
  Future<Student> putStudent(Student student, [int id]) {
    if ((id != null && id != 1540120) ||
        (student.id != null && student.id != 1540120)) {
      throw "Mock server only works with Kai";
    }
    kai = student;
    return Future.value(kai);
  }

  @override
  Future<List<int>> getStudentImage(int id) async {
    if (id != 1540120) throw "Mock server only works with Kai";
    return kaiPicture ?? (await _client.get("/mock/IMG_20190307_173901.jpg")).bodyBytes;
  }

  @override
  Future<void> putStudentImage(List<int> imageData, int id) {
    if (id != 1540120) throw "Mock server only works with Kai";
    kaiPicture = imageData;
    return Future.value();
  }
}
