import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class UserRegisterRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> registerUser(
    Map<String, dynamic> data, {
    bool isFileUpload = false,
  }) async {
    return await _apiServices.postApi(
      data,
      ApiUrls.userRegisterApi,
      isFileUpload: true,
    );
  }
}
