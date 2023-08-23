abstract class BaseApiServices {
// GET Api Header Setting
  Future<dynamic> getApi({required String url, Map<String, String>? header});

// POST Api Header Setting
  Future<dynamic> postApi(
      {required dynamic data,
      Map<String, String>? header,
      required String url});
}
