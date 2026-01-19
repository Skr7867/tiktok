import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class CamReportGenerateRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> camReportGenerate(
    Map<String, dynamic> data,
    String token,
  ) async {
    return await _apiServices.postApi(
      data,
      ApiUrls.camReportGenerateApi,
      token: token,
    );
  }
}
