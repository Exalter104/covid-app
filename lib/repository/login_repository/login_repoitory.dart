import 'package:my_flutter_boilerplate/data/network/network_api_services.dart';
import 'package:my_flutter_boilerplate/utils/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) {
    dynamic response = _apiServices.postApi(data: data, url: AppUrl.loginUrl);
    return response;
  }
}
