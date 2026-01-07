import '../../../res/api_urls/api_urls.dart';
import '../../data/network/network_api_services.dart';
import '../../models/CibilScore/cibil_score_model.dart';

class CustomerCibilScoreRepository {
  final _apiService = NetworkApiServices();

  Future<CibilScoreModel> getCibilByid(String token, String userId) async {
    final url = '${ApiUrls.getCustomerCibilScoreApi}/$userId';
    dynamic response = await _apiService.getApi(url, token: token);
    return CibilScoreModel.fromJson(response);
  }
}
