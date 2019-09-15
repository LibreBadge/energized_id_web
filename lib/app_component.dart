import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/blocs/id_bloc.dart';
// ignore: unused_import
import 'src/repositories/mock_student_repository.dart';
import 'src/repositories/student_repository.dart';
import 'src/routing.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'id-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives, routerDirectives],
  providers: [
    ClassProvider(StudentRepository),
  ],
  exports: [Routes],
)
class AppComponent {}
