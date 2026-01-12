import 'dart:developer';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../models/LoanList/loan_list_model.dart';
import '../../../repository/LoanList/loan_list_repository.dart';
import '../../services/user_session_service.dart';

class LoanListController extends GetxController {
  final LoanListRepository _repository = LoanListRepository();
  final UserSessionService _sessionService = UserSessionService();

  /// API STATE
  final Rx<Status> rxStatus = Status.LOADING.obs;
  final RxString errorMessage = ''.obs;

  /// DATA
  final RxList<Data> loanList = <Data>[].obs;

  /// FILTER
  final RxString selectedFilter = 'All Applications'.obs;
  final RxString searchQuery = ''.obs;

  /// USER
  late final String userId;

  @override
  void onInit() {
    super.onInit();
    userId = Get.arguments as String;
    fetchLoanList();
  }

  Future<void> fetchLoanList() async {
    try {
      rxStatus.value = Status.LOADING;

      final token = _sessionService.token;
      if (token == null || token.isEmpty) {
        throw Exception('Auth token not found');
      }

      final response = await _repository.loanList(token, userId);

      final List<Data> list = response.data ?? [];

      if (response.success == true && list.isNotEmpty) {
        loanList.assignAll(list);
        rxStatus.value = Status.COMPLETED;
      } else {
        rxStatus.value = Status.ERROR;
        errorMessage.value = 'No loan applications found';
      }
    } catch (e, stack) {
      log('LoanListController → fetchLoanList', error: e, stackTrace: stack);
      rxStatus.value = Status.ERROR;
      errorMessage.value = e.toString();
    }
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }

  void updateSearch(String value) {
    searchQuery.value = value.trim().toLowerCase();
  }
}
