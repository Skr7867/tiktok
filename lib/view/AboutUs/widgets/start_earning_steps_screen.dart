import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/color/app_colors.dart';
import '../../../viewModels/controllers/Theme/theme_controller.dart';

class StartEarningStepsScreen extends StatelessWidget {
  const StartEarningStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          const Text(
            'Start Earning in 4 Simple Steps',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.opensansRegular,
            ),
          ),
          const SizedBox(height: 6),

          /// Subtitle
          const Text(
            'Your journey to earning commissions starts here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontFamily: AppFonts.opensansRegular,
            ),
          ),

          const SizedBox(height: 24),

          /// Steps
          _StepCard(
            step: '01',
            title: 'Register Customer',
            description:
                'Quick 2 minute customer registration with minimal documentation and instant verification.',
            icon: Icons.person_add_alt_1,
          ),

          const SizedBox(height: 14),

          _StepCard(
            step: '02',
            title: 'Submit Loan Application',
            description:
                'Submit vehicle loan applications to 50+ banks through single unified dashboard.',
            icon: Icons.description_outlined,
          ),

          const SizedBox(height: 14),

          _StepCard(
            step: '03',
            title: 'Track Approval',
            description:
                'Real time tracking of loan applications with 24-48 hour approval timeline.',
            icon: Icons.show_chart,
          ),

          const SizedBox(height: 14),

          _StepCard(
            step: '04',
            title: 'Earn Commissions',
            description:
                'Receive up to 2.5% commission with weekly payouts and real time earnings tracker.',
            icon: Icons.currency_rupee,
          ),
        ],
      ),
    );
  }
}

/// ================= Step Card =================
class _StepCard extends StatelessWidget {
  final String step;
  final String title;
  final String description;
  final IconData icon;

  const _StepCard({
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
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
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Step Number
          Container(
            height: 34,
            width: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF0B5ED7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              step,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.opensansRegular,
              ),
            ),
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

          /// Right Icon
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F0FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF0B5ED7)),
          ),
        ],
      ),
    );
  }
}
