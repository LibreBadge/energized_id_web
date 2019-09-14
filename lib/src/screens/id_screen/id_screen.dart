import 'package:angular/angular.dart';

import '../../blocs/id_bloc.dart';
import '../../components/form_component/form_component.dart';
import '../../components/id_preview_component/id_preview_component.dart';
import '../../repositories/student_repository.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'id-screen-id',
  styleUrls: ['id_screen.css'],
  templateUrl: 'id_screen.html',
  directives: [coreDirectives, IdFormComponent, IdPreviewComponent],
)
class IdScreen implements OnInit, OnDestroy {
  final StudentRepository _studentRepository;
  IdScreen(this._studentRepository);

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
