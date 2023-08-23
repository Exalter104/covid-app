import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/repository/login_repository/login_repoitory.dart';

import 'package:my_flutter_boilerplate/utils/utils.dart';

class LoginController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  var usertoken = ''.obs;
  final loading = false.obs;
  // StoreUserData userData = Get.put(StoreUserData());
  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final _api = LoginRepository();

  loginApi() async {
    try {
      loading.value = true;
      update();
      var data = {
        "email": emailController.value.text,
        "password": passwordController.value.text
      };
      await _api.loginApi(data).then((value) async {
        // await userData.login(value['key']);
        // Get.offAllNamed(RoutesName.homeMainScreen, arguments: usertoken.value);
        emailController.value.clear();
        passwordController.value.clear();
        loading.value = false;
        update();
      }).onError((error, stackTrace) {
        var errorr = jsonDecode(error.toString());
        String errorMessage = '';
        for (var entry in errorr.entries) {
          String fieldName = entry.key == 'non_field_errors' ? '' : entry.key;
          List<String> errorMessages = (entry.value as List).cast<String>();
          errorMessage +=
              '${capitalizeFirstLetter(fieldName)}${entry.key == 'non_field_errors' ? '' : ':'} ${errorMessages.map((msg) => capitalizeFirstLetter(msg)).join(', ')}\n';
        }
        Utils.snackBar('Error', errorMessage, action: 'error');
      });
      loading.value = false;
      passwordController.value.clear();
      update();
    } catch (error) {
      Utils.snackBar('Error', 'Check your internet connection and try again.',
          action: 'error');
      loading.value = false;
      update();
    }
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }

    return input[0].toUpperCase() + input.substring(1);
  }
}
