import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/utils/routes/routes_name.dart';

import 'package:my_flutter_boilerplate/views/auth_view/login_screen.dart';
import 'package:my_flutter_boilerplate/views/auth_view/register_screen.dart';
import 'package:my_flutter_boilerplate/views/home_screen/home_screen_component/home_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RoutesName.registerScreen,
          page: () => const RegisterationScreen(),
        ),
      ];
}
