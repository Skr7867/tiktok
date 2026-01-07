import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class CustomerRegistrationRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> customerCibilCheck(
      Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.customerConsentApi,
        token: token);
  }
}
