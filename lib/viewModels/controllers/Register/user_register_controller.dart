import 'dart:developer';
import 'dart:io';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:dsa/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/UserRegister/user_register_repository.dart';

class UserRegisterController extends GetxController {
  final UserRegisterRepository _repo = UserRegisterRepository();

  // 🔹 Text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController registrationTypeController =
      TextEditingController();

  // 🔹 State
  final selectedRegistrationType = ''.obs;
  final Rx<File?> businessDocument = Rx<File?>(null);

  final isGstValid = false.obs;
  final isSubmitting = false.obs;

  // -------------------------------
  // REGISTRATION TYPE
  // -------------------------------
  void showRegistrationTypeSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_sheetItem('Individual'), _sheetItem('Business')],
        ),
      ),
    );
  }

  Widget _sheetItem(String value) {
    return ListTile(
      title: Text(value),
      onTap: () {
        registrationTypeController.text = value;
        selectedRegistrationType.value = value;

        if (value != 'Business') {
          gstController.clear();
          businessDocument.value = null;
          isGstValid.value = false;
        }

        Get.back();
      },
    );
  }

  // -------------------------------
  // GST VALIDATION
  // -------------------------------
  void validateGst(String value) {
    final gstRegex = RegExp(
      r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$',
    );
    isGstValid.value = gstRegex.hasMatch(value.trim());
  }

  // -------------------------------
  // FILE PICKER
  // -------------------------------
  Future<void> pickBusinessDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);

      final sizeInMB = file.lengthSync() / (1024 * 1024);
      if (sizeInMB > 5) {
        Get.snackbar('Error', 'File size must be less than 5MB');
        return;
      }

      businessDocument.value = file;
    }
  }

  // -------------------------------
  // CONTINUE ENABLE CHECK
  // -------------------------------
  bool get canContinue {
    if (selectedRegistrationType.value == 'Business') {
      return isGstValid.value && businessDocument.value != null;
    }
    return true;
  }

  // -------------------------------
  // REGISTER USER (MAIN LOGIC) - FIXED
  // -------------------------------
  Future<void> registerUser({required String phone}) async {
    if (isSubmitting.value) return;

    if (selectedRegistrationType.value.isEmpty) {
      Utils.snackBar('Please select registration type', 'Error');
      return;
    }

    try {
      isSubmitting.value = true;

      final Map<String, dynamic> data = {
        "name": nameController.text.trim(),
        "phone": phone,
        "email": emailController.text.trim(),
        "location": locationController.text.trim(),
        "registrationType": selectedRegistrationType.value.toLowerCase(),
        "aadharNo": aadharController.text.trim(),
        "panCardNo": panController.text.trim(),
      };

      if (selectedRegistrationType.value == 'Business') {
        final file = businessDocument.value;
        if (file == null) {
          Utils.snackBar('Please upload business document', 'Error');
          isSubmitting.value = false;
          return;
        }

        data["gstNumber"] = gstController.text.trim();
        // Pass the file path instead of MultipartFile object
        data["businessDocumentFilePath"] = file.path;

        if (kDebugMode) {
          log('File path: ${file.path}');
          log('File size: ${file.lengthSync()} bytes');
        }
      }

      final response = await _repo.registerUser(
        data,
        isFileUpload: selectedRegistrationType.value == 'Business',
      );

      isSubmitting.value = false;

      if (response != null && response['success'] == true) {
        Utils.snackBar(response['message'], 'Success');
        Get.toNamed(RouteName.loginscreen);
      } else {
        Utils.snackBar(response['message'] ?? 'Registration failed', 'Error');
      }
    } catch (e) {
      isSubmitting.value = false;
      Get.snackbar('Error', e.toString());
      log(e.toString());
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    aadharController.dispose();
    panController.dispose();
    gstController.dispose();
    registrationTypeController.dispose();
    super.onClose();
  }
}
