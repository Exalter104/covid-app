import 'package:my_flutter_boilerplate/data/network/network_api_services.dart';
import 'package:my_flutter_boilerplate/utils/app_url/app_url.dart';

class RegisterRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> registerApi(var data) {
    dynamic response =
        _apiServices.postApi(data: data, url: AppUrl.registerUrl);
    return response;
  }
}
