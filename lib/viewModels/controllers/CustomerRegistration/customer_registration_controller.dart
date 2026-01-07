import 'package:dsa/res/routes/routes_name.dart';
import 'package:get/get.dart';
import '../../../data/cibilcacheservice/cibil_cache_service.dart';
import '../../../models/CibilScore/cibil_score_model.dart';
import '../../services/user_session_service.dart';
import '../../../repository/CustomerRegistration/customer_registration_repository.dart';
import '../../../repository/CustomerRegistration/check_civil_score_repository.dart';
import '../../../utils/utils.dart';

class CustomerRegistrationController extends GetxController {
  final CustomerRegistrationRepository _repository =
      CustomerRegistrationRepository();
  final CheckCibilScoreRepository _checkCibilScoreRepository =
      CheckCibilScoreRepository();

  final UserSessionService _sessionService = Get.find<UserSessionService>();

  final canVerifyLocation = false.obs;
  final canVerifyAadhar = false.obs;
  final canVerifyPan = false.obs;

  final isLoading = false.obs;
  final agree = true.obs;

  bool get canSubmitCibil => agree.value && canVerifyPan.value;

  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('Session expired. Please login again.');
    }
    return token;
  }

  /// 🔹 REGISTER CUSTOMER → CHECK CIBIL → FETCH REPORT
  Future<void> checkCustomerCibilScore() async {
    try {
      isLoading.value = true;

      /// 1️⃣ CUSTOMER REGISTRATION / CONSENT API
      final response = await _repository.customerCibilCheck(
        {"agree": agree.value},
        token,
      );

      if (response == null || response['user'] == null) {
        throw Exception(response?['message'] ?? 'Registration failed');
      }

      /// ✅ Extract user + token correctly
      final userJson = response['user'];
      final String userId = userJson['id'].toString();
      final String newToken = response['token'];

      isLoading.value = false;

      // SHOW LOADING SCREEN
      Get.toNamed(RouteName.fetchCibilLoadingScreen);

      /// 4️⃣ FETCH CIBIL SCORE USING userId
      final scoreResponse = await _checkCibilScoreRepository.checkCibilScore(
        {"userId": userId},
        newToken,
      );

      if (scoreResponse == null || scoreResponse['success'] != true) {
        throw Exception(scoreResponse?['message'] ?? 'Failed to fetch CIBIL');
      }

      final cibilModel = CibilScoreModel.fromJson(scoreResponse);
      final cacheService = CibilCacheService();
      await cacheService.saveCibilScore(cibilModel);

      /// 🔹 NAVIGATE & PASS userId
      Get.offNamed(
        RouteName.cibilScoreScreen,
        arguments: {
          'userId': userId,
        },
      );
    } catch (e) {
      isLoading.value = false;
      if (Get.isOverlaysOpen) Get.back();

      Utils.snackBar(
        e.toString().replaceAll('Exception:', '').trim(),
        'Error',
      );
    }
  }
}
