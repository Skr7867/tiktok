import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class CustomerMobileVerifyOtpRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> mobileVerifyOtp(
      Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.mobileVerifyOtp,
        token: token);
  }
}
