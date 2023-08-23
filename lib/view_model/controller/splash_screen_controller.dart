import 'dart:async';

import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/utils/routes/routes_name.dart';

class SplashScreenController extends GetxController {
  // final StoreUserData sessionController = Get.put(StoreUserData());

  @override
  void onInit() {
    isLogin();
    super.onInit();
  }

  void isLogin() {
    Timer(const Duration(seconds: 2),
        () => Get.offAllNamed(RoutesName.homeMainScreen));
    // : Get.offAllNamed(RoutesName.welcomeScreen));
    update();
  }
}
