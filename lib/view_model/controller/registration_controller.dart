import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/repository/registration_repository/registration_repository.dart';

import 'package:my_flutter_boilerplate/utils/utils.dart';

class RegisterController extends GetxController {
//>>>>>>>>>>>>>>>>>>>>>> EDITING CONTROLLER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final userNameFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordController = TextEditingController().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final loading = false.obs;

  //>>>>>>>>>>>>>>>>>>>>>> POST API CALL OF REPO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  final _api = RegisterRepository();

  registerApi() async {
    try {
      loading.value = true;
      update();
      var data = {
        "username": userNameController.value.text,
        "email": emailController.value.text,
        "password": passwordController.value.text,
        "password2": confirmPasswordController.value.text,
        // "building": buildingId.value
      };
      await _api.registerApi(data).then((value) {
        Utils.snackBar("Registration ", "Successfully Registered",
            action: "success");
        emailController.value.clear();
        passwordController.value.clear();

        loading.value = false;
        update();
      }).onError((error, stackTrace) {
        var errorr = jsonDecode(error.toString());
        String errorMessage = '';
        for (var entry in errorr.entries) {
          String fieldName = entry.key;
          List<String> errorMessages = (entry.value as List).cast<String>();
          errorMessage +=
              '${capitalizeFirstLetter(fieldName)}: ${errorMessages.map((msg) => capitalizeFirstLetter(msg)).join(', ')}\n';
        }
        Utils.snackBar('Error', errorMessage, action: 'error');
      });
      loading.value = false;
      update();
    } catch (e) {
      Utils.snackBar('Error', 'Check your internet connection and try again',
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
