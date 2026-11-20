import 'package:get/get.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://example.com/api';
    httpClient.timeout = const Duration(seconds: 30);

    httpClient.addRequestModifier<dynamic>((request) {
      // Authentication headers can be added here later.
      return request;
    });

    super.onInit();
  }

  Future<Response<dynamic>> getData(String endpoint) {
    return get(endpoint);
  }

  Future<Response<dynamic>> postData(
    String endpoint,
    Map<String, dynamic> data,
  ) {
    return post(endpoint, data);
  }
}
