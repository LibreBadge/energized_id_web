import 'package:angular_router/angular_router.dart';

import 'screens/id_screen/id_screen.template.dart' as id_screen_template;

class Routes {
  Routes._();

  static final idScreen = RouteDefinition(
    path: "print",
    component: id_screen_template.IdScreenNgFactory,
    useAsDefault: true,
  );

  static final all = [
    idScreen,
  ];
}
