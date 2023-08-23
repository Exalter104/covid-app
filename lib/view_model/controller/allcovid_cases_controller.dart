// ignore_for_file: empty_catches

import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/repository/login_repository/all_case_repository.dart';

class AllCovidCasesController extends GetxController {
  final _allcovidCasesRepo = AllCovidCasesRepository();
  List allCovidCasesModel = [].obs;
  RxBool isLoading = true.obs;
  RxBool isRefresh = true.obs;
  RxBool isDataAvailable = false.obs;
  @override
  void onReady() {
    super.onInit();
    getAllCovidCases();
  }

  getAllCovidCases() async {
    try {
      var response = await _allcovidCasesRepo.getApi();
      if (response is Map<String, dynamic>) {
        allCovidCasesModel = [response]; // Wrap the map in a list
        isDataAvailable.value = true; // Set the flag to true
        update();
        isRefresh.value = false;
        isLoading.value = false;
      }
    } catch (e) {
      print("Error fetching data: $e");
      isRefresh.value = false;
      isLoading.value = false;
    }
  }
}
