import 'package:angular/angular.dart';

import 'src/blocs/id_bloc.dart';
import 'src/components/form_component.dart';
import 'src/repositories/mock_student_repository.dart';
import 'src/repositories/student_repository.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'id-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives, IdFormComponent],
  providers: [
    ClassProvider(StudentRepository, useClass: MockStudentRepository)
  ],
)
class AppComponent implements OnInit, OnDestroy {
  final StudentRepository _studentRepository;
  AppComponent(this._studentRepository);

  IdBloc idBloc;

  @override
  void ngOnInit() {
    idBloc = IdBloc(_studentRepository);
  }

  @override
  void ngOnDestroy() {
    idBloc.dispose();
  }
}
