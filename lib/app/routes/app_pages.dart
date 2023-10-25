import 'home_routes.dart';
import 'auth_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = '/splash';

  static final routes = [
    ...HomeRoutes.routes,
		...AuthRoutes.routes,
  ];
}
