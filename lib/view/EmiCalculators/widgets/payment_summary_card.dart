import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/color/app_colors.dart';
import '../../../viewModels/controllers/Theme/theme_controller.dart';

class PaymentSummaryCards extends StatelessWidget {
  final String totalPayment;
  final String tenureText;
  final String interestAmount;
  final String interestPercent;

  const PaymentSummaryCards({
    super.key,
    required this.totalPayment,
    required this.tenureText,
    required this.interestAmount,
    required this.interestPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _infoCard(
          title: "Total Payment",
          amount: totalPayment,
          subtitle: tenureText,
          icon: Icons.currency_rupee,
          iconBg: const Color(0xffE6F0FF),
          iconColor: Colors.blue,
        ),
        const SizedBox(height: 14),
        _infoCard(
          title: "Interest Payable",
          amount: interestAmount,
          subtitle: interestPercent,
          icon: Icons.percent,
          iconBg: const Color(0xffFFF1E6),
          iconColor: Colors.orange,
        ),
      ],
    );
  }

  Widget _infoCard({
    required String title,
    required String amount,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
        ],
      ),
    );
  }
}
