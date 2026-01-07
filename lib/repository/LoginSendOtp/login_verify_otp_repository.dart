import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class LoginVerifyOtpRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginVerifyOtp(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, ApiUrls.loginVerifyOtp);
  }
}
