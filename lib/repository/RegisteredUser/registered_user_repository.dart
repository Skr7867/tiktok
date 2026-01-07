import '../../../res/api_urls/api_urls.dart';
import '../../data/network/network_api_services.dart';
import '../../models/Registered/reistered_user_model.dart';

class RegisteredUserRepository {
  final _apiService = NetworkApiServices();

  Future<RegisterdUserModel> registeredUser(String token) async {
    dynamic response =
        await _apiService.getApi(ApiUrls.registeredUserApi, token: token);
    return RegisterdUserModel.fromJson(response);
  }
}
