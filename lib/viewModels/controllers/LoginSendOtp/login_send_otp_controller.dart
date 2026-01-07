import 'package:dsa/data/hive/loginResponse/login_response_hive.dart';
import 'package:dsa/data/hive/partener/partner_hive.dart';
import 'package:dsa/repository/LoginSendOtp/login_send_otp_repository.dart';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:dsa/utils/utils.dart';
import 'package:dsa/view/Login/widgets/login_otp_dialog_box.dart';
import 'package:dsa/viewModels/services/user_session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/LoginSendOtp/login_verify_otp_repository.dart';
import '../UserProfile/user_profile_controller.dart';

class LoginSendOtpController extends GetxController {
  final LoginSendOtpRepository _loginSendOtpRepo = LoginSendOtpRepository();
  final LoginVerifyOtpRepository _loginVerifyOtpRepo =
      LoginVerifyOtpRepository();

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
      builder: (_) => const LoginOtpDialogBox(),
    );
  }

  /// 🔹 SEND OTP
  Future<void> loginSendOtp(BuildContext context) async {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      Utils.snackBar('Please enter your 10 digit mobile number', 'Info');
      return;
    }

    final payload = {"phone": phone};

    try {
      isLoading.value = true;

      final response = await _loginSendOtpRepo.loginSendOtp(payload);

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
  Future<void> loginVerifyOtp({
    required String otp,
    required BuildContext context,
  }) async {
    final phone = phoneController.text.trim();

    final payload = {"phone": phone, "otp": otp};

    try {
      isVerifyingOtp.value = true;

      final response = await _loginVerifyOtpRepo.loginVerifyOtp(payload);

      isVerifyingOtp.value = false;

      if (response != null && response['success'] == true) {
        /// ✅ 1️⃣ CREATE HIVE USER MODEL (HERE 🔥)
        final hiveUser = LoginResponseHive(
          success: response['success'],
          message: response['message'],
          token: response['token'],
          partner: PartnerHive(
            id: response['partner']?['_id'],
            name: response['partner']?['name'],
            email: response['partner']?['email'],
            phone: response['partner']?['phone'],
            location: response['partner']?['location'],
            registrationType: response['partner']?['registrationType'],
            gstNumber: response['partner']?['gstNumber'],
            businessDocumentUrl: response['partner']?['businessDocumentUrl'],
            role: response['partner']?['role'],
            blocked: response['partner']?['blocked'],
            isApproved: response['partner']?['isApproved'],
            createdAt: response['partner']?['createdAt'],
            updatedAt: response['partner']?['updatedAt'],
            registeredUsersCount: response['partner']?['registeredUsersCount'],
          ),
        );

        final sessionService = UserSessionService();
        await sessionService.saveUser(hiveUser);

        // 🔥 FETCH FULL PROFILE & UPDATE HIVE
        final profileController = Get.put(UserProfileController());
        await profileController.fetchAndUpdateProfile();

        // CLOSE OTP DIALOG
        Navigator.pop(context);

        // NAVIGATE
        Utils.toastMessageCenter(response['message'] ?? 'Login successful');
        Get.offAllNamed(RouteName.homeScreen);
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
