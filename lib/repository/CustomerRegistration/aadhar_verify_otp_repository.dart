import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class AadharVerifyOtpRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> aadharVerifyOtp(
      Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.aadharVerifyOtp,
        token: token);
  }
}
