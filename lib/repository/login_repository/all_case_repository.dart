import 'package:my_flutter_boilerplate/data/network/network_api_services.dart';
import 'package:my_flutter_boilerplate/utils/app_url/app_url.dart';

class AllCovidCasesRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> getApi() {
    dynamic response = _apiServices.getApi(url: AppUrl.allCovidCasesUrl);
    return response;
  }
}
