import 'package:angular/angular.dart';
import 'package:energized_id_web/app_component.template.dart' as ng;
import 'package:http/http.dart' as http;

import 'main.template.dart' as self;

@GenerateInjector([
  ClassProvider(http.Client),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
