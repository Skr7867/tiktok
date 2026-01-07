import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class SendOtpRepsitory {
  final _apiServices = NetworkApiServices();
  Future<dynamic> sendMobileOtp(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, ApiUrls.sendOtpApi);
  }
}
