import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class AadharSendOtpRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> aadharSendOtp(Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.aadharSendOtp,
        token: token);
  }
}
