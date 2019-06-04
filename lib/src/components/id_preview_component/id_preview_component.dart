import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';

import '../../blocs/id_bloc.dart';

@Component(
  selector: "id-preview",
  templateUrl: "id_preview_component.html",
  styleUrls: ["id_preview_component.css"],
  directives: [coreDirectives],
  pipes: [commonPipes, Base64EncodePipe, BlocPipe],
)
class IdPreviewComponent {
  @Input()
  IdBloc idBloc;

  String get expires {
    var now = DateTime.now();
    if (now.month >= 8) {
      return "08/${now.year + 1}";
    } else {
      return "08/${now.year}";
    }
  }
}

@Pipe("base64encode")
class Base64EncodePipe implements PipeTransform {
  String transform(List<int> value) => base64Encode(value ?? []);
}