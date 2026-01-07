import 'dart:developer';

import 'package:dsa/repository/CustomerRegistration/aadhar_send_otp_repository.dart';
import 'package:dsa/repository/CustomerRegistration/aadhar_verify_otp_repository.dart';
import 'package:dsa/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/CustomerRegistration/Widgets/aadhar_send_verify_otp_box.dart';
import '../../services/user_session_service.dart';
import 'customer_registration_controller.dart';

class CustomerAadharSendVerifyOtpController extends GetxController {
  final AadharSendOtpRepository _aadharSendOtpRepository =
      AadharSendOtpRepository();
  final AadharVerifyOtpRepository _aadharVerifyOtpRepository =
      AadharVerifyOtpRepository();
  final UserSessionService _sessionService = Get.find<UserSessionService>();
  final TextEditingController aadharController = TextEditingController();

  final isLoading = false.obs;
  final isVerifyingOtp = false.obs;
  final isAadharVerified = false.obs;
  final apiOtp = ''.obs;

  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('User session expired. Please login again.');
    }
    return token;
  }

  /// 🔹 SHOW OTP DIALOG
  void showOtpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AadharSendVerifyOtpBox(),
    );
  }

  /// 🔹 SEND OTP
  Future<void> aadharSendOtp(BuildContext context) async {
    final aadhar = aadharController.text.trim();

    if (aadhar.length != 12) {
      Utils.snackBar('Please enter your 12-digit aadhar number', 'Info');
      return;
    }

    final payload = {"aadharNo": aadhar};

    try {
      isLoading.value = true;

      final response =
          await _aadharSendOtpRepository.aadharSendOtp(payload, token);

      isLoading.value = false;

      if (response != null &&
          response['message'] ==
              'OTP sent successfully to your Aadhaar-linked mobile number.') {
        apiOtp.value = response['otp']?.toString() ?? '';

        Utils.toastMessageCenter(
            'OTP sent to your aadhar linked mobile number');
        showOtpDialog(context);
        isAadharVerified.value = true;
        Get.find<CustomerRegistrationController>().canVerifyPan.value = true;
      } else {
        Utils.snackBar(response['message'] ?? 'OTP sending failed', 'Error');
        log(response['message']);
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      Utils.snackBar(e.toString(), 'Error');
    }
  }

  /// 🔹 VERIFY OTP
  Future<void> customerVerifyOtp({
    required String otp,
    required BuildContext context,
  }) async {
    final payload = {"otp": otp};

    try {
      isVerifyingOtp.value = true;

      final response =
          await _aadharVerifyOtpRepository.aadharVerifyOtp(payload, token);

      isVerifyingOtp.value = false;

      if (response != null &&
          response['message'] == 'Aadhaar OTP verified successfully') {
        Navigator.pop(context);
      } else {
        Utils.snackBar(response['message'] ?? 'Invalid OTP', 'Error');
      }
    } catch (e) {
      isVerifyingOtp.value = false;
      Utils.snackBar(e.toString(), 'Error');
      log(e.toString());
    }
  }

  @override
  void onClose() {
    aadharController.dispose();
    super.onClose();
  }
}
