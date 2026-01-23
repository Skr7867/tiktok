import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/view/Register/widgets/user_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../viewModels/controllers/Theme/theme_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.blackColor : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                      ),
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
                          color: const Color(0xFF1D6FE9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1D6FE9).withOpacity(0.3),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.shield_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 🔹 Title
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Partner ',
                                style: TextStyle(
                                  fontFamily: AppFonts.opensansRegular,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.color,
                                ),
                              ),
                              TextSpan(
                                text: 'Portal',
                                style: TextStyle(
                                  fontFamily: AppFonts.opensansRegular,
                                  fontSize: 35,
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

                      const SizedBox(height: 20),

                      // 🔹 Feature Tiles
                      _featureTile(
                        context: context,
                        icon: Icons.trending_up,
                        title: 'Strategic Growth',
                        subtitle: 'Access exclusive business opportunities',
                      ),

                      _featureTile(
                        context: context,
                        icon: Icons.verified_outlined,
                        title: 'Verified Network',
                        subtitle: 'Join our trusted partner ecosystem',
                      ),

                      _featureTile(
                        context: context,
                        icon: Icons.security_outlined,
                        title: 'Secure Platform',
                        subtitle: 'Bank-level security for all operations',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              //*****************************************User Register Widgets*****************************/
              UserRegisterWidget(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Feature Tile
  Widget _featureTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final themeController = Get.find<ThemeController>();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF1D6FE9), size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: AppFonts.opensansRegular,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),

                _buildDrawerItem(
                  context,
                  icon: Icons.sunny,
                  title: 'Theme',
                  value: themeController.isDarkMode.value
                      ? 'dark_mode'.tr
                      : 'light_mode'.tr,
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Theme',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                                fontFamily: AppFonts.opensansRegular,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                              leading: Icon(
                                PhosphorIconsRegular.moon,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                              ),
                              title: Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.color,
                                  fontFamily: AppFonts.opensansRegular,
                                ),
                              ),
                              onTap: () {
                                if (!themeController.isDarkMode.value) {
                                  themeController.switchTheme();
                                }
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                PhosphorIconsRegular.sun,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                              ),
                              title: Text(
                                'Light Mode',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.color,
                                  fontFamily: AppFonts.opensansRegular,
                                ),
                              ),
                              onTap: () {
                                if (themeController.isDarkMode.value) {
                                  themeController.switchTheme();
                                }
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                      isScrollControlled: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? value,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout
            ? AppColors.redColor
            : Theme.of(context).textTheme.bodyLarge?.color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout
              ? Colors.red
              : Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 15,
          fontFamily: AppFonts.opensansRegular,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
