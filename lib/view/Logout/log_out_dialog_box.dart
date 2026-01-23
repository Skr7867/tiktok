import 'package:dsa/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/color/app_colors.dart';
import '../../res/fonts/app_fonts.dart';
import '../../viewModels/controllers/Theme/theme_controller.dart';
import '../../viewModels/services/user_session_service.dart';

void showLogoutDialog(BuildContext context) {
  final UserSessionService sessionService = Get.put(UserSessionService());
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  final themeController = Get.find<ThemeController>();
  final bool isDark = themeController.isDarkMode.value;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      backgroundColor: isDark ? AppColors.blackColor : Colors.white,
      title: Text(
        "Log Out",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.opensansRegular,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      content: Text(
        "Are you sure you want to logout?",
        style: TextStyle(
          fontFamily: AppFonts.opensansRegular,
          color: AppColors.textColor,
        ),
      ),
      actions: [
        // ---- Cancel Button ----
        SizedBox(
          width: screenWidth * 0.2,
          height: screenHeight * 0.05,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueShade,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'No',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: AppFonts.opensansRegular,
              ),
            ),
          ),
        ),

        SizedBox(width: screenWidth * 0.01),

        // ---- Confirm Logout Button ----
        SizedBox(
          width: screenWidth * 0.3,
          height: screenHeight * 0.05,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () async {
              await sessionService.logout();
              Navigator.of(ctx).pop();
              Get.offAllNamed(RouteName.loginscreen);
            },
            // async call wrapped in sync function
            child: Text(
              'Yes',
              style: TextStyle(
                color: AppColors.redColor,
                fontFamily: AppFonts.opensansRegular,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
