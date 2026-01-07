import 'package:dsa/repository/MobilleNumberVerify/send_otp_repsitory.dart';
import 'package:dsa/repository/OtpVerify/otp_verify_repository.dart'
    show OtpVerifyRepository;
import 'package:dsa/utils/utils.dart';
import 'package:dsa/view/Register/widgets/otp_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendOtpController extends GetxController {
  final SendOtpRepsitory _sendOtpRepo = SendOtpRepsitory();
  final OtpVerifyRepository _verifyOtpRepo = OtpVerifyRepository();

  final TextEditingController phoneController = TextEditingController();

  final isLoading = false.obs;
  final isVerifyingOtp = false.obs;
  final isPhoneVerified = false.obs;
  final apiOtp = ''.obs;

  /// 🔹 SHOW OTP DIALOG
  void showOtpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const OtpDialog(),
    );
  }

  /// 🔹 SEND OTP
  Future<void> sendOtp(BuildContext context) async {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      Utils.snackBar('Please enter your 10 digit mobile number', 'Info');
      return;
    }

    final payload = {"phone": phone};

    try {
      isLoading.value = true;

      final response = await _sendOtpRepo.sendMobileOtp(payload);

      isLoading.value = false;

      if (response != null && response['success'] == true) {
        apiOtp.value = response['otp']?.toString() ?? '';
        Utils.toastMessageCenter('OTP sent to your mobile number');
        showOtpDialog(context);
      } else {
        Utils.snackBar(response['message'] ?? 'OTP sending failed', 'Error');
      }
    } catch (e) {
      isLoading.value = false;
      Utils.snackBar(e.toString(), 'Error');
    }
  }

  /// 🔹 VERIFY OTP
  Future<void> verifyOtp({
    required String otp,
    required BuildContext context,
  }) async {
    final phone = phoneController.text.trim();

    final payload = {"phone": phone, "otp": otp};

    try {
      isVerifyingOtp.value = true;

      final response = await _verifyOtpRepo.verifyOtp(payload);

      isVerifyingOtp.value = false;

      if (response != null && response['success'] == true) {
        isPhoneVerified.value = true;
        Navigator.pop(context);
        Utils.toastMessageCenter(response['message'] ?? 'Phone verified');
      } else {
        Utils.snackBar(response['message'] ?? 'Invalid OTP', 'Error');
      }
    } catch (e) {
      isVerifyingOtp.value = false;
      Utils.snackBar(e.toString(), 'Error');
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
