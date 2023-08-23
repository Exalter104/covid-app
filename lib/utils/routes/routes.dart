import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/utils/routes/routes_name.dart';

import 'package:my_flutter_boilerplate/views/home_screen/home_screen_component/home_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
      ];
}
