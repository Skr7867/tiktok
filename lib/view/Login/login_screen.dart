import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/view/Login/widgets/user_login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModels/controllers/Theme/theme_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHight * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Partner ',
                          style: TextStyle(
                            fontFamily: AppFonts.opensansRegular,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                        TextSpan(
                          text: 'Portal',
                          style: TextStyle(
                            fontFamily: AppFonts.opensansRegular,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2563EB), // Blue
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: const Text(
                    'Strategic Business Partnership Platform',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyColor,
                      fontFamily: AppFonts.opensansRegular,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Feature Cards
                _featureTile(
                  icon: Icons.trending_up,
                  title: 'Real-time Business Analytics',
                ),

                _featureTile(
                  icon: Icons.people_outline,
                  title: 'Network Expansion Tools',
                ),

                _featureTile(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Exclusive Partner Benefits',
                ),

                _featureTile(
                  icon: Icons.security_outlined,
                  title: 'Secure & Confidential',
                ),
                // ************************************Login container Widgets***************************************
                UserLoginWidgets(),

                SizedBox(height: screenHight * 0.07),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Feature Tile Widget
  Widget _featureTile({required IconData icon, required String title}) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : const Color(0xFFE0EDFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF2563EB), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.opensansRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
