import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/component/round_button.dart';
import 'package:dsa/res/custom_widgets/custome_textfield.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:dsa/viewModels/controllers/LoginSendOtp/login_send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModels/controllers/Theme/theme_controller.dart';

class UserLoginWidgets extends StatelessWidget {
  const UserLoginWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final loginSendOtp = Get.put(LoginSendOtpController());
    double screenHight = MediaQuery.of(context).size.height;
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 Top Icon
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: isDark ? Colors.black : const Color(0xFF1D6FE9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Title
          const Text(
            'Partner Login',
            style: TextStyle(
              fontFamily: AppFonts.opensansRegular,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // 🔹 Subtitle
          const Text(
            'Manage your business partnerships\nand growth',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.opensansRegular,
              fontSize: 14,
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 24),

          // 🔹 Mobile Number Row
          Row(
            children: const [
              Text(
                'Mobile\nNumber',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: AppFonts.opensansRegular,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Individual: 7438478437 | Business: 8989007834',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.opensansRegular,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 🔹 Mobile Input
          CustomTextField(
            fillColor: isDark ? Colors.black : Colors.white,
            controller: loginSendOtp.phoneController,
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone,
            hintText: 'Enter 10 Digit Mobile Number',
            maxLength: 10,
            borderColor: AppColors.greyColor.withOpacity(0.4),
          ),

          const SizedBox(height: 20),

          // Send OTP Button (Disabled UI)
          Obx(() {
            return RoundButton(
              loading: loginSendOtp.isLoading.value,
              buttonColor: AppColors.blueColor,
              width: double.infinity,
              title: 'Send OTP',
              onPress: () {
                if (!loginSendOtp.isLoading.value) {
                  loginSendOtp.loginSendOtp(context);
                }
              },
            );
          }),

          SizedBox(height: screenHight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an Account?",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: AppFonts.opensansRegular,
                  color: AppColors.textColor,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.registerScreen);
                },
                child: Text(
                  " Register",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.opensansRegular,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
