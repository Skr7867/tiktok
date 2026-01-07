import 'package:dsa/repository/CustomerRegistration/pan_verify_repository.dart';
import 'package:dsa/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/user_session_service.dart';

class PanVerifyController extends GetxController {
  final PanVerifyRepository _panVerifyRepository = PanVerifyRepository();
  final TextEditingController panController = TextEditingController();
  final UserSessionService _sessionService = Get.find<UserSessionService>();
  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('User session expired. Please login again.');
    }
    return token;
  }

  final isLoading = false.obs;
  final isPanVerified = false.obs;
  final apiOtp = ''.obs;

  /// 🔹 SEND OTP
  Future<void> verifyPanCard(BuildContext context) async {
    final pan = panController.text.trim();

    if (pan.length != 10) {
      Utils.snackBar('Please enter your PAN card number', 'Info');
      return;
    }

    final payload = {"panCardNo": pan};

    try {
      isLoading.value = true;

      final response = await _panVerifyRepository.panVerify(payload, token);

      isLoading.value = false;

      if (response != null &&
          response['message'] == 'PAN verified successfully.') {
        isPanVerified.value = true;
      } else {
        Utils.snackBar(response['message'] ?? 'OTP sending failed', 'Error');
      }
    } catch (e) {
      isLoading.value = false;
      Utils.snackBar(e.toString(), 'Error');
    }
  }

  /// 🔹 VERIFY OTP
  // Future<void> customerVerifyOtp({
  //   required String otp,
  //   required BuildContext context,
  // }) async {
  //   final phone = phoneController.text.trim();

  //   final payload = {"phone": phone, "otp": otp};

  //   try {
  //     isVerifyingOtp.value = true;

  //     final response =
  //         await _mobileVerifyOtpRepository.mobileVerifyOtp(payload);

  //     isVerifyingOtp.value = false;

  //     if (response != null && response['success'] == true) {
  //       Navigator.pop(context);
  //     } else {
  //       Utils.snackBar(response['message'] ?? 'Invalid OTP', 'Error');
  //     }
  //   } catch (e) {
  //     isVerifyingOtp.value = false;
  //     Utils.snackBar(e.toString(), 'Error');
  //   }
  // }

  @override
  void onClose() {
    panController.dispose();
    super.onClose();
  }
}
