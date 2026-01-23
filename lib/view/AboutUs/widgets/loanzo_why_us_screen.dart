import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModels/controllers/Theme/theme_controller.dart';

class LoanzoWhyUsScreen extends StatelessWidget {
  const LoanzoWhyUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          const Text(
            'Why LoanZo Partners Love Us',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.opensansRegular,
            ),
          ),
          const SizedBox(height: 6),

          /// Subtitle
          const Text(
            'Everything you need to build a successful vehicle loan\ndistribution business',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
              fontFamily: AppFonts.opensansRegular,
            ),
          ),

          const SizedBox(height: 24),

          /// Card 1
          _FeatureCard(
            backgroundColor: isDark
                ? AppColors.blackColor
                : const Color(0xFFD9FBEA),
            icon: Icons.currency_rupee,
            title: 'High Commissions',
            description:
                'Earn 1.5% to 2.5% commission on every loan, paid weekly\nwithout delays',
          ),

          const SizedBox(height: 16),

          /// Card 2
          _FeatureCard(
            backgroundColor: isDark
                ? AppColors.blackColor
                : const Color(0xFFE3F0FF),
            icon: Icons.apartment_rounded,
            title: 'Multiple Banks',
            description:
                'Access to 50+ banking partners increases your approval\nrates significantly',
          ),

          const SizedBox(height: 16),

          /// Card 3
          _FeatureCard(
            backgroundColor: isDark
                ? AppColors.blackColor
                : const Color(0xFFFFF4CC),
            icon: Icons.access_time_filled,
            title: 'Quick Processing',
            description:
                '24-48 hour loan approval with minimal documentation\nrequirements',
          ),
          const SizedBox(height: 16),
          _FeatureCard(
            backgroundColor: isDark
                ? AppColors.blackColor
                : const Color(0xFFE3F0FF),
            icon: Icons.business_rounded,
            title: 'Business Growth',
            description:
                'Free CRM and marketing tools to help you acquire more\ncustomer',
          ),
        ],
      ),
    );
  }
}

/// ================= Feature Card Widget =================
class _FeatureCard extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 2),
        // ],
      ),
      child: Column(
        children: [
          /// Icon container
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF0B5ED7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),

          const SizedBox(height: 12),

          /// Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,

              fontFamily: AppFonts.opensansRegular,
            ),
          ),

          const SizedBox(height: 6),

          /// Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12.5,
              fontFamily: AppFonts.opensansRegular,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
