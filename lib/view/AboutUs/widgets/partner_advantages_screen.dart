import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/color/app_colors.dart';
import '../../../viewModels/controllers/Theme/theme_controller.dart';

class PartnerAdvantageScreen extends StatelessWidget {
  const PartnerAdvantageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          const Text(
            'Partner Advantage',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),

          /// Subtitle
          const Text(
            'The most partner-friendly platform in the vehicle loan industry',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, height: 1.4),
          ),

          const SizedBox(height: 24),

          /// Cards
          _AdvantageTile(
            icon: Icons.adjust,
            iconBg: const Color(0xFF1E88E5),
            title: 'Strategic Bank Partnerships',
            description:
                'Access 50+ banking partners including HDFC,\nICICI, Axis Bank, and other leading financial\ninstitutions.',
          ),

          const SizedBox(height: 14),

          _AdvantageTile(
            icon: Icons.trending_up,
            iconBg: const Color(0xFF00A86B),
            title: 'Higher Commission Rates',
            description:
                'Earn up to 2.5% commission on every loan\ndisbursed - significantly higher than industry\nstandards.',
          ),

          const SizedBox(height: 14),

          _AdvantageTile(
            icon: Icons.shield_outlined,
            iconBg: const Color(0xFF1565C0),
            title: 'Secure & Timely Payouts',
            description:
                'Guaranteed weekly payouts directly to your bank\naccount with complete transaction transparency.',
          ),

          const SizedBox(height: 14),

          _AdvantageTile(
            icon: Icons.show_chart,
            iconBg: const Color(0xFFF39C12),
            title: 'Exclusive Growth Tools',
            description:
                'Get free CRM, marketing materials, and business\ngrowth tools to scale your operations.',
          ),
        ],
      ),
    );
  }
}

/// ================= Advantage Tile =================
class _AdvantageTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String description;

  const _AdvantageTile({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon box
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),

          const SizedBox(width: 12),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontFamily: AppFonts.opensansRegular,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
