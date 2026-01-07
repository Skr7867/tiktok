import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/component/round_button.dart';
import 'package:dsa/res/custom_widgets/custome_textfield.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:dsa/viewModels/controllers/Register/user_register_controller.dart';
import 'package:dsa/viewModels/controllers/SendOtp/send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_dialog_box.dart';

class UserRegisterWidget extends StatelessWidget {
  UserRegisterWidget({super.key});
  final UserRegisterController userRegister = Get.put(UserRegisterController());
  final SendOtpController sendOtpController = Get.put(SendOtpController());

  void showOtpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const OtpDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Header
          const Center(
            child: Column(
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppFonts.opensansRegular,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tell us about yourself',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Step Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Step 1 of 2',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFonts.opensansRegular,
                ),
              ),
              Text(
                'Personal Info',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontFamily: AppFonts.opensansRegular,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.5,
              minHeight: 6,
              backgroundColor: Color(0xFFE5E7EB),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),

          const SizedBox(height: 20),

          /// 🔹 Full Name
          _label('Full Name *'),
          CustomTextField(
            controller: userRegister.nameController,
            hintText: 'Enter your full name',
            prefixIcon: Icons.person_2_outlined,
          ),

          /// 🔹 Registration Type
          const SizedBox(height: 16),

          /// 🔹 Phone Number
          _label('Phone Number *'),
          CustomTextField(
            controller: sendOtpController.phoneController,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            hintText: 'Enter 10 digit Mobile Number',
            prefixIcon: Icons.phone,

            suffixIcon: Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: sendOtpController.isPhoneVerified.value
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Verified',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : RoundButton(
                        fontSize: 11,
                        width: 60,
                        buttonColor: AppColors.blueColor,
                        title: 'Verify',
                        loading: sendOtpController.isLoading.value,
                        onPress: () {
                          if (!sendOtpController.isLoading.value) {
                            sendOtpController.sendOtp(context);
                          }
                        },
                      ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Email Address
          _label('Email Address *'),
          CustomTextField(
            controller: userRegister.emailController,
            hintText: 'your@email.com',
            prefixIcon: Icons.email,
          ),

          const SizedBox(height: 16),

          /// 🔹 Aadhar Number
          _label('Aadhar Number *'),
          CustomTextField(
            controller: userRegister.aadharController,
            hintText: '12 - digit Aadhar number',
            maxLength: 12,
            keyboardType: TextInputType.number,
            prefixIcon: Icons.numbers_outlined,
          ),

          const SizedBox(height: 16),

          /// 🔹 PAN Card
          _label('PAN Card Number *'),
          CustomTextField(
            controller: userRegister.panController,
            hintText: 'ABCDE1234F (EXAMPLE)',
            prefixIcon: Icons.credit_card,
          ),
          const SizedBox(height: 24),

          _label('Business Location'),
          CustomTextField(
            controller: userRegister.locationController,
            hintText: 'Enter your business location',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.gps_fixed, color: AppColors.greyColor),
            ),
          ),
          const SizedBox(height: 24),
          _label('Registration Type *'),
          GestureDetector(
            onTap: userRegister.showRegistrationTypeSheet,
            child: AbsorbPointer(
              child: _textField(
                controller: userRegister.registrationTypeController,
                hint: 'Select registration type',
                icon: Icons.badge_outlined,
                suffixIcon: Icons.keyboard_arrow_down,
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// 🔹 BUSINESS EXTRA FIELDS (ONLY WHEN BUSINESS SELECTED)
          Obx(() {
            if (userRegister.selectedRegistrationType.value != 'Business') {
              return const SizedBox.shrink();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                /// GST Number
                _label('GST Number *'),
                CustomTextField(
                  controller: userRegister.gstController,
                  hintText: '22ABCDE1234F1Z5',
                  prefixIcon: Icons.receipt_long_outlined,
                  onChanged: userRegister.validateGst,
                ),

                Obx(
                  () => userRegister.isGstValid.value
                      ? const SizedBox.shrink()
                      : const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'Invalid GST number',
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ),
                ),

                const SizedBox(height: 16),

                /// Business Registration Document
                _label('Business Registration Document *'),

                GestureDetector(
                  onTap: userRegister.pickBusinessDocument,
                  child: Obx(() {
                    final file = userRegister.businessDocument.value;
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFD0D5DD),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            file == null
                                ? Icons.cloud_upload_outlined
                                : Icons.check_circle,
                            color: file == null ? Colors.blue : Colors.green,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            file == null
                                ? 'Upload Business Registration Document'
                                : file.path.split('/').last,
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: AppFonts.opensansRegular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'PDF, JPG, PNG (Max 5MB)',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 8),

                /// Document Requirements (small helper text)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Document requirements:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.opensansRegular,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '• Maximum file size: 5MB\n'
                        '• Supported formats: PDF, JPG, PNG\n'
                        '• Ensure all text is clear and readable\n'
                        '• Document should be valid and up-to-date',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontFamily: AppFonts.opensansRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
              ],
            );
          }),

          /// 🔹 Continue Button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    userRegister.canContinue && !userRegister.isSubmitting.value
                    ? () {
                        userRegister.registerUser(
                          phone: sendOtpController.phoneController.text.trim(),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  disabledBackgroundColor: Colors.blue.withOpacity(0.4),
                ),
                child: userRegister.isSubmitting.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Continue →',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: AppFonts.opensansRegular,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          /// 🔹 Footer
          Center(
            child: InkWell(
              onTap: () => Get.toNamed(RouteName.loginscreen),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.opensansRegular,
                    color: Colors.grey,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Already a partner? ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Label
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: AppFonts.opensansRegular,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 🔹 TextField
  Widget _textField({
    required String hint,
    required IconData icon,
    IconData? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: AppFonts.opensansRegular,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
