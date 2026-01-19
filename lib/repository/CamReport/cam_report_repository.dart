import '../../../res/api_urls/api_urls.dart';
import '../../data/network/network_api_services.dart';
import '../../models/CamReport/cam_report_model.dart';

class CamReportRepository {
  final _apiService = NetworkApiServices();

  Future<CamReportModel> getCamReportByid(String token, String userId) async {
    final url = '${ApiUrls.camReportApi}/$userId';
    dynamic response = await _apiService.getApi(url, token: token);
    return CamReportModel.fromJson(response);
  }
}
