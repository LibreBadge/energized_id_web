import 'package:angular_router/angular_router.dart';

import 'screens/id_screen/id_screen.template.dart' as id_screen_template;

class Routes {
  Routes._();

  static final idScreen = RouteDefinition(
    path: "production",
    component: id_screen_template.IdScreenNgFactory,
    useAsDefault: false,
  );

    static final idScreenCopy = RouteDefinition(
    path: "test",
    component: id_screen_copy_template.IdScreenNgFactory,
    useAsDefault: true,
  );

  static final all = [
    idScreen,
  ];
}
