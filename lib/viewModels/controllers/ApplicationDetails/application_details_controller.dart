import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../repository/ApplicationDetails/application_details_repository.dart';
import '../../../models/ApplicationLoanDetails/application_loan_details_model.dart';
import '../../services/user_session_service.dart';

class ApplicationDetailsController extends GetxController {
  /// Dependencies
  final ApplicationDetailsRepository _repository =
      ApplicationDetailsRepository();
  final UserSessionService _sessionService = UserSessionService();

  /// State
  final status = Status.LOADING.obs;
  final errorMessage = ''.obs;

  /// Data
  final applicationResponse = Rxn<LoanApplicationResponse>();

  /// Getters for UI
  LoanApplicationData? get application => applicationResponse.value?.data;

  bool get isLoading => status.value == Status.LOADING;
  bool get isSuccess => status.value == Status.COMPLETED;
  bool get isError => status.value == Status.ERROR;

  @override
  void onInit() {
    super.onInit();
    _loadApplicationDetails();
  }

  /// 🔹 Fetch Application Details
  Future<void> _loadApplicationDetails() async {
    try {
      status.value = Status.LOADING;

      /// Get token
      final token = _sessionService.token;
      if (token == null || token.isEmpty) {
        throw Exception('User not logged in');
      }

      /// Get userId
      final user = _sessionService.getUser();
      final userId = user?.partner?.id;

      if (userId == null || userId.isEmpty) {
        throw Exception('User ID not found');
      }

      /// API CALL
      final response = await _repository.loanList(token, userId);

      applicationResponse.value = response;
      status.value = Status.COMPLETED;
    } catch (e) {
      errorMessage.value = e.toString();
      status.value = Status.ERROR;
    }
  }

  /// 🔁 Retry (for pull-to-refresh / error screen)
  Future<void> retry() async {
    await _loadApplicationDetails();
  }
}
