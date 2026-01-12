import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModels/controllers/Theme/theme_controller.dart';

class CheckCustomerLoanEligibility extends StatelessWidget {
  const CheckCustomerLoanEligibility({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Check Customer Loan Eligibility',
        automaticallyImplyLeading: true,
      ),

      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [Text('fghj')]),
      ),
    );
  }
}
