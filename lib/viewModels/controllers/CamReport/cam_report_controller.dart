import 'dart:developer';

import 'package:get/get.dart';

import '../../../models/CamReport/cam_report_model.dart';
import '../../../repository/CamReport/cam_report_repository.dart';
import '../../services/user_session_service.dart';

class CamReportController extends GetxController {
  final CamReportRepository _repository = CamReportRepository();
  final UserSessionService _sessionService = UserSessionService();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rxn<CamReportModel> camReport = Rxn<CamReportModel>();

  late final String userId;

  @override
  void onInit() {
    super.onInit();
    userId = Get.arguments as String;
    log('📌 CamReportController initialized for userId: $userId');
  }

  @override
  void onReady() {
    super.onReady();
    fetchCamReport();
  }

  Future<void> fetchCamReport() async {
    final token = _sessionService.token;

    if (token == null || token.isEmpty) {
      errorMessage.value = 'User not authenticated';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _repository.getCamReportByid(token, userId);

      camReport.value = response;

      if (response.hasCam != true) {
        errorMessage.value = 'CAM report not generated yet';
      }
    } catch (e, s) {
      errorMessage.value = 'Failed to load CAM report';
      log(e.toString());
      log(s.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool get hasData => camReport.value?.data?.camReport != null;

  CamReport? get report => camReport.value?.data?.camReport;
  ExecutiveSummary? get executiveSummary => report?.executiveSummary;
  Applicant? get applicant => report?.applicant;
  RiskAssessment? get riskAssessment => report?.riskAssessment;
  Decision? get decision => report?.decision;
}
