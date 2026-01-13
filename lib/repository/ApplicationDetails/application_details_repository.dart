import '../../data/network/network_api_services.dart';
import '../../models/ApplicationLoanDetails/application_loan_details_model.dart';
import '../../res/api_urls/api_urls.dart';

class ApplicationDetailsRepository {
  final _apiService = NetworkApiServices();

  Future<LoanApplicationResponse> loanList(String token, String userId) async {
    final url = '${ApiUrls.loanApplicationDetailsApi}/$userId';
    dynamic response = await _apiService.getApi(url, token: token);
    return LoanApplicationResponse.fromJson(response);
  }
}
