import 'package:dsa/repository/CustomerRegistration/customer_mobile_send_otp_repository.dart';
import 'package:dsa/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/user_session_service.dart';
import 'customer_registration_controller.dart';

class CustomerMobileVerifyController extends GetxController {
  final CustomerMobileSendOtpRepository _customerMobileSendOtpRepository =
      CustomerMobileSendOtpRepository();
  final TextEditingController phoneController = TextEditingController();
  final UserSessionService _sessionService = Get.find<UserSessionService>();

  final isLoading = false.obs;
  final isVerifyingOtp = false.obs;
  final isPhoneVerified = false.obs;
  final apiOtp = ''.obs;
  final hasAutoCalledApi = false.obs;

  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('User session expired. Please login again.');
    }
    return token;
  }

  @override
  void onInit() {
    super.onInit();

    phoneController.addListener(() {
      final phone = phoneController.text.trim();

      // Reset flags if user edits number again
      if (phone.length < 10) {
        isPhoneVerified.value = false;
        hasAutoCalledApi.value = false;
        return;
      }

      // Auto-call API when exactly 10 digits entered
      if (phone.length == 10 && !hasAutoCalledApi.value) {
        hasAutoCalledApi.value = true;
        customerMobileVerify(Get.context!);
      }
    });
  }

  /// 🔹 SEND OTP
  Future<void> customerMobileVerify(BuildContext context) async {
    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      Utils.snackBar('Please enter your 10 digit mobile number', 'Info');
      return;
    }

    final payload = {"phone": phone};

    try {
      isLoading.value = true;

      final response = await _customerMobileSendOtpRepository.mobileSendOtp(
        payload,
        token,
      );

      isLoading.value = false;

      if (response != null && response['phoneVerified'] == true) {
        isPhoneVerified.value = true;
        Get.find<CustomerRegistrationController>().canVerifyLocation.value =
            true;
      } else {
        throw Exception(response?['message'] ?? 'Failed to verify you number');
      }
    } catch (e) {
      isLoading.value = false;
      Utils.snackBar(
        e.toString().replaceAll('Exception:', '').trim(),
        'Error',
      );
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
