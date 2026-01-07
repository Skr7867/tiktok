import 'dart:developer';

import 'package:dsa/repository/UserProfile/user_profile_repository.dart';
import 'package:get/get.dart';

import '../../../data/hive/partenerHiveMapper/partner_hive_mapper.dart';
import '../../services/user_session_service.dart';

class UserProfileController extends GetxController {
  final UserProfileRepository _repository = UserProfileRepository();
  final UserSessionService _sessionService = Get.find<UserSessionService>();

  /// 🔥 Fetch profile from API and update Hive
  Future<void> fetchAndUpdateProfile() async {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) return;

    try {
      final response = await _repository.getUserProfile(token);
      final data = response.data;
      if (data == null) return;

      final partner = PartnerHiveMapper.fromProfileApi(data);

      await _sessionService.updateProfile(partner);
    } catch (e) {
      log(e.toString());
    }
  }
}
