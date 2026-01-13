import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';

class CheckEligibilityRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> checkLoanEligibility(
    Map<String, dynamic> data, {
    bool isFileUpload = false,
  }) async {
    return await _apiServices.postApi(
      data,
      ApiUrls.checkLoanEligibilityStage1Api,
      isFileUpload: true,
    );
  }
}
