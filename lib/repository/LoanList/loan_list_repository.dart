import 'package:dsa/res/api_urls/api_urls.dart';

import '../../data/network/network_api_services.dart';
import '../../models/LoanList/loan_list_model.dart';

class LoanListRepository {
  final _apiService = NetworkApiServices();

  Future<LoanListModel> loanList(String token, String userId) async {
    final url = '${ApiUrls.loanListApi}/$userId';
    dynamic response = await _apiService.getApi(url, token: token);
    return LoanListModel.fromJson(response);
  }
}
