import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class PanVerifyRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> panVerify(Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.panVerifyOtp, token: token);
  }
}
