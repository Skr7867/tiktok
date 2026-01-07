import 'package:dsa/repository/CustomerRegistration/location_repository.dart';
import 'package:dsa/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/user_session_service.dart';
import 'customer_registration_controller.dart';

class LocationController extends GetxController {
  final LocationRepository _locationRepository = LocationRepository();
  final TextEditingController locationController = TextEditingController();
  final UserSessionService _sessionService = Get.find<UserSessionService>();

  final isLoading = false.obs;
  final isLocationVerified = false.obs;
  final apiLocation = ''.obs;

  String get token {
    final token = _sessionService.token;
    if (token == null || token.isEmpty) {
      throw Exception('User session expired. Please login again.');
    }
    return token;
  }

  //SEND OTP
  Future<void> locationVerify(BuildContext context) async {
    final location = locationController.text.trim();

    if (location.isEmpty) {
      Utils.snackBar('Please enter your current location', 'Info');
      return;
    }

    final payload = {"locationText": location};

    try {
      isLoading.value = true;

      final response = await _locationRepository.locationVerify(payload, token);

      isLoading.value = false;

      if (response != null && response['message'] == "Manual location saved") {
        apiLocation.value = response['locationText']?.toString() ?? '';
        isLocationVerified.value = true;
        isLocationVerified.value = true;
        Get.find<CustomerRegistrationController>().canVerifyAadhar.value = true;
        Utils.snackBar('Address Verified', 'Success');
      } else {
        Utils.snackBar('Failed to verify', 'Failed');
      }
    } catch (e) {
      isLoading.value = false;
      Utils.snackBar(e.toString(), 'Error');
    }
  }

  /// 🔹 VERIFY OTP
  Future<void> customerVerifyOtp({
    required String otp,
    required BuildContext context,
  }) async {
    final location = locationController.text.trim();

    final payload = {
      "locationText": location,
    };

    try {
      final response = await _locationRepository.locationVerify(payload, token);

      if (response != null && response['success'] == true) {
        Navigator.pop(context);
      } else {
        Utils.snackBar(response['message'] ?? 'Invalid OTP', 'Error');
      }
    } catch (e) {
      Utils.snackBar(e.toString(), 'Error');
    }
  }

  @override
  void onClose() {
    locationController.dispose();
    super.onClose();
  }
}
