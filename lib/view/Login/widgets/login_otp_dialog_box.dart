import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/viewModels/controllers/LoginSendOtp/login_send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModels/controllers/Theme/theme_controller.dart';

class LoginOtpDialogBox extends StatefulWidget {
  const LoginOtpDialogBox({super.key});

  @override
  State<LoginOtpDialogBox> createState() => LoginOtpDialogBoxState();
}

class LoginOtpDialogBoxState extends State<LoginOtpDialogBox> {
  final loginSendOtpController = Get.find<LoginSendOtpController>();
  final int otpLength = 6;
  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  bool isVerifyEnabled = false;
  String otp = '';

  @override
  void initState() {
    super.initState();

    otpControllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final apiOtp = loginSendOtpController.apiOtp.value;

      if (apiOtp.isNotEmpty && apiOtp.length == otpLength) {
        for (int i = 0; i < otpLength; i++) {
          otpControllers[i].text = apiOtp[i];
        }
        otp = apiOtp;
        isVerifyEnabled = true;
        loginSendOtpController.loginVerifyOtp(otp: apiOtp, context: context);
      }
    });
  }

  void _onOtpChanged() {
    otp = otpControllers.map((e) => e.text).join();

    if (otp.length == otpLength) {
      setState(() => isVerifyEnabled = true);

      // AUTO VERIFY
      loginSendOtpController.loginVerifyOtp(otp: otp, context: context);
    } else {
      setState(() => isVerifyEnabled = false);
    }
  }

  @override
  void dispose() {
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Dialog(
      backgroundColor: isDark ? AppColors.blackColor : const Color(0xFFEFF6FF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    color: AppColors.blueColor,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const Text(
              'Verify Identity',
              style: TextStyle(
                fontSize: 18,
                fontFamily: AppFonts.opensansRegular,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (loginSendOtpController.apiOtp.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  'OTP: ${loginSendOtpController.apiOtp.value}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
              ),

            const SizedBox(height: 16),

            /// OTP BOXES (ONE ROW – RESPONSIVE)
            LayoutBuilder(
              builder: (context, constraints) {
                final spacing = 10 * (otpLength - 1);
                final size = (constraints.maxWidth - spacing) / otpLength;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    otpLength,
                    (index) => SizedBox(
                      width: size,
                      height: size,
                      child: _otpBox(index),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            /// VERIFY BUTTON
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed:
                      isVerifyEnabled &&
                          !loginSendOtpController.isVerifyingOtp.value
                      ? () {
                          loginSendOtpController.loginVerifyOtp(
                            otp: otp,
                            context: context,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor,
                    disabledBackgroundColor: AppColors.blueColor.withOpacity(
                      0.4,
                    ),
                  ),
                  child: loginSendOtpController.isVerifyingOtp.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Verify',
                          style: TextStyle(
                            fontFamily: AppFonts.opensansRegular,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpBox(int index) {
    return TextField(
      controller: otpControllers[index],
      focusNode: focusNodes[index],
      keyboardType: TextInputType.number,
      maxLength: 1,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) {
        if (value.isNotEmpty && index < otpLength - 1) {
          focusNodes[index + 1].requestFocus();
        }
        _onOtpChanged();
      },
    );
  }
}
