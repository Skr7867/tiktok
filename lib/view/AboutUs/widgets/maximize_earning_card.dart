import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModels/controllers/Theme/theme_controller.dart';

class MaximizeEarningsCard extends StatelessWidget {
  const MaximizeEarningsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        decoration: BoxDecoration(
          color: isDark ? AppColors.blackColor : const Color(0xFF0B5ED7),
          border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title
            const Text(
              'Ready to Maximize Your Earnings?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.5,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            /// Subtitle
            const Text(
              'Join 12,500+ successful partners earning\n₹50,000+ monthly through our platform',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.5,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 16),

            /// Stats
            _StatBox(title: '2.5%', subtitle: 'Max Commission'),

            const SizedBox(height: 10),

            _StatBox(title: '50+', subtitle: 'Banking Partners'),

            const SizedBox(height: 10),

            _StatBox(title: '24/7', subtitle: 'Partner Support'),

            const SizedBox(height: 18),

            /// Primary Button
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.person_add_alt,
                  color: Color(0xFF0B5ED7),
                  size: 18,
                ),
                label: const Text(
                  'Register Customer Now',
                  style: TextStyle(
                    color: Color(0xFF0B5ED7),
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
                onPressed: () {
                  Get.toNamed(RouteName.customerRegistration);
                },
              ),
            ),

            const SizedBox(height: 10),

            /// Secondary Button
            SizedBox(
              width: double.infinity,
              height: 42,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                label: const Text(
                  'Download Partner Kit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= Stat Box =================
class _StatBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatBox({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 11.5),
          ),
        ],
      ),
    );
  }
}
