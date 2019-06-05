import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';

import '../../blocs/id_bloc.dart';
import '../../models/student.dart';
import '../webcam_capture/webcam_capture.dart';

@Component(
  selector: "id-form",
  templateUrl: "form_component.html",
  styleUrls: ["form_component.css"],
  directives: [coreDirectives, WebcamCapture],
  pipes: [BlocPipe, DatePipe],
)
class IdFormComponent {
  @Input()
  IdBloc idBloc;

  Student get currentStudentCopy {
    var currentStudent = idBloc.currentState.studentInfo;
    return Student()
      ..id = currentStudent.id
      ..firstName = currentStudent.firstName
      ..lastName = currentStudent.lastName
      ..gradeLevel = currentStudent.gradeLevel
      ..lastPrinted = currentStudent.lastPrinted;
  }

  void save() {
    idBloc.dispatch(SaveEvent());
  }

  void load() {
    idBloc.dispatch(LoadEvent());
  }

  void updateId(String newId) {
    idBloc.dispatch(UpdateEvent(currentStudentCopy..id = int.parse(newId)));
  }

  void updateFirstName(String newName) {
    idBloc.dispatch(UpdateEvent(currentStudentCopy..firstName = newName));
  }

  void updateLastName(String newName) {
    idBloc.dispatch(UpdateEvent(currentStudentCopy..lastName = newName));
  }

  void updateGradeLevel(String newGrade) {
    idBloc.dispatch(
        UpdateEvent(currentStudentCopy..gradeLevel = int.parse(newGrade)));
  }

  void updateLastPrinted() {
    idBloc
      ..dispatch(UpdateEvent(currentStudentCopy..lastPrinted = DateTime.now()))
      ..dispatch(SaveEvent());
  }
}
