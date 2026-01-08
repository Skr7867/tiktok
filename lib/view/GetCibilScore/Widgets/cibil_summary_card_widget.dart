import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/color/app_colors.dart';
import '../../../viewModels/controllers/CibilScore/cibil_score_controller.dart';
import '../../../viewModels/controllers/Theme/theme_controller.dart';
import 'summary_tiles_widget.dart';

class CibilSummaryCards extends StatelessWidget {
  const CibilSummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCibilScoreController controller =
        Get.find<UserCibilScoreController>();
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Column(
      children: [
        SummaryTile(
          title: 'Active Loans',
          value: controller.cibilScore.value!.report!.summary!.totalActiveLoans!
              .toString(),
          icon: Icons.account_balance,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.blue,
        ),
        SummaryTile(
          title: 'Active Credit Cards',
          value: controller
              .cibilScore
              .value!
              .report!
              .summary!
              .totalActiveCreditCards!
              .toString(),
          icon: Icons.credit_card,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.green,
        ),
        SummaryTile(
          title: 'Loan Outstanding',
          value: controller
              .cibilScore
              .value!
              .report!
              .summary!
              .totalLoanOutstanding!
              .toString(),
          icon: Icons.currency_rupee,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.purple,
        ),
        SummaryTile(
          title: 'Card Outstanding',
          value: controller
              .cibilScore
              .value!
              .report!
              .summary!
              .totalCardOutstanding!
              .toString(),
          icon: Icons.credit_card_outlined,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.deepOrange,
        ),
        SummaryTile(
          title: 'Overdue Payments',
          value: controller
              .cibilScore
              .value!
              .report!
              .summary!
              .overduePaymentsCount!
              .toString(),
          icon: Icons.warning_amber_rounded,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.red,
        ),
        SummaryTile(
          title: 'Oldest Account',
          value: controller
              .cibilScore
              .value!
              .report!
              .summary!
              .ageOfOldestAccount!
              .toString(),
          icon: Icons.calendar_month,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.blue,
        ),

        SummaryTile(
          title: 'Recent Enquiries (3m)',
          value: controller
              .cibilScore
              .value!
              .report!
              .summary!
              .recentEnquiriesCount3m!
              .toString(),
          icon: Icons.search,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.orange,
        ),
        SummaryTile(
          title: 'Total Accounts',
          value: controller.cibilScore.value!.report!.summary!.totalAccounts!
              .toString(),
          icon: Icons.layers,
          bgColor: isDark ? AppColors.blackColor : Color(0xFFF1F7FF),
          valueColor: Colors.teal,
        ),
      ],
    );
  }
}
