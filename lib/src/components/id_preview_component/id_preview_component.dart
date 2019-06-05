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

  static String get _expires {
    var now = DateTime.now();
    if (now.month >= 8) {
      return "08/${now.year + 1}";
    } else {
      return "08/${now.year}";
    }
  }

  final String expires = _expires; // only calculate once

  static const gradeColors = {
    9: "blue",
    10: "green",
    11: "orange",
    12: "darkgrey",
  };
}

@Pipe("base64encode")
class Base64EncodePipe implements PipeTransform {
  String transform(List<int> value) => base64Encode(value ?? []);
}
