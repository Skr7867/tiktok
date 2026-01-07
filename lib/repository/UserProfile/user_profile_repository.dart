import '../../../res/api_urls/api_urls.dart';
import '../../data/network/network_api_services.dart';

import '../../models/UserProfile/user_profile_model.dart';

class UserProfileRepository {
  final _apiService = NetworkApiServices();
  Future<UserProfileModel> getUserProfile(String token) async {
    dynamic response = await _apiService.getApi(
      ApiUrls.userProfile,
      token: token,
    );
    return UserProfileModel.fromJson(response);
  }
}
