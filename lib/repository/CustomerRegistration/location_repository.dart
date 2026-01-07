import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class LocationRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> locationVerify(
      Map<String, dynamic> data, String token) async {
    return await _apiServices.postApi(data, ApiUrls.locationApi, token: token);
  }
}
