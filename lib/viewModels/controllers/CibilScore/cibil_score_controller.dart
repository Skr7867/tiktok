import 'package:dsa/repository/CustomerCibilScore/customer_cibil_score_repository.dart';
import 'package:get/get.dart';
import '../../../data/cibilcacheservice/cibil_cache_service.dart';
import '../../../models/CibilScore/cibil_score_model.dart';
import '../../../utils/utils.dart';
import '../../services/user_session_service.dart';

class UserCibilScoreController extends GetxController {
  final CustomerCibilScoreRepository _repository =
      CustomerCibilScoreRepository();
  final UserSessionService _sessionService = Get.find<UserSessionService>();
  final CibilCacheService _cacheService = CibilCacheService();

  final isLoading = false.obs;
  final cibilScore = Rxn<CibilScoreModel>();

  late final String userId;

  // TOKEN FROM SESSION
  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('Session expired. Please login again.');
    }
    return token;
  }

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>?;
    userId = args?['userId'] ?? '';

    if (userId.isEmpty) {
      Utils.snackBar('Invalid user id', 'Error');
      return;
    }

    loadCibilScore();
  }

  // LOAD CIBIL (CACHE → API)
  Future<void> loadCibilScore() async {
    try {
      isLoading.value = true;

      // CHECK CACHE FIRST
      final cached = await _cacheService.getValidCibilScore();
      if (cached != null) {
        cibilScore.value = cached;
        isLoading.value = false;
        return;
      }

      // FETCH FROM API USING userId
      final response = await _repository.getCibilByid(token, userId);

      //  SAVE TO CACHE
      await _cacheService.saveCibilScore(response);

      cibilScore.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      Utils.snackBar(
        e.toString().replaceAll('Exception:', '').trim(),
        'Error',
      );
    }
  }
}
