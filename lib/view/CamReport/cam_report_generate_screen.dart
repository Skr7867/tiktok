import 'package:dsa/res/component/round_button.dart';
import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/color/app_colors.dart';
import '../../res/fonts/app_fonts.dart';
import '../../viewModels/controllers/Theme/theme_controller.dart';
import '../../viewModels/controllers/CamReport/cam_report_generate_controller.dart';

class CamReportGenerateScreen extends StatelessWidget {
  const CamReportGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final controller = Get.put(CamReportGenerateController());
    final bool isDark = themeController.isDarkMode.value;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Generate your CAM Report',
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.blackColor : Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 10,
                      offset: const Offset(0, -4), // 👆 top shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 14,
                      offset: const Offset(0, 6), // 👇 bottom shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(),
                      const SizedBox(height: 16),
                      _employmentType(controller),
                      const SizedBox(height: 16),
                      _incomeField(controller),
                      const SizedBox(height: 16),
                      _obligationSwitch(controller),
                      const SizedBox(height: 12),
                      Obx(
                        () => controller.hasObligations.value
                            ? _obligationAmount(controller)
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Obx(() {
                final loading = controller.isLoading.value;

                return RoundButton(
                  loading: loading,
                  buttonColor: AppColors.blueColor,
                  width: 350,
                  title: loading
                      ? 'CAM Report is generating...'
                      : 'Generate CAM Report',
                  onPress: loading ? null : controller.generateCamReport,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================

  Widget _header() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.blueColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.description_outlined, color: AppColors.blueColor),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Generate CAM Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.opensansRegular,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Fill customer details to generate comprehensive credit assessment',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: AppFonts.opensansRegular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= EMPLOYMENT =================

  Widget _employmentType(CamReportGenerateController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label('Employment Type *'),
        const SizedBox(height: 8),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _employmentTile(
                  title: 'Salaried',
                  selected: controller.employmentType.value == 'Salaried',
                  onTap: () => controller.selectEmployment('Salaried'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _employmentTile(
                  title: 'Self-Employed',
                  selected: controller.employmentType.value == 'Self-Employed',
                  onTap: () => controller.selectEmployment('Self-Employed'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _employmentTile({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.blueColor : AppColors.greyColor,
            width: selected ? 1.5 : 1,
          ),
          color: selected
              ? AppColors.blueColor.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Column(
          children: [
            Icon(
              title == 'Salaried'
                  ? Icons.business_center_outlined
                  : Icons.storefront_outlined,
              color: selected ? AppColors.blueColor : Colors.grey,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontFamily: AppFonts.opensansRegular,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.blueColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= INCOME =================

  Widget _incomeField(CamReportGenerateController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label('Monthly Income (₹) *'),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller.monthlyIncomeController,
          decoration: InputDecoration(
            hintText: 'Enter monthly income',
            prefixIcon: const Icon(Icons.currency_rupee),
            helperText: 'Gross monthly income from all sources',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          style: const TextStyle(fontFamily: AppFonts.opensansRegular),
        ),
      ],
    );
  }

  // ================= OBLIGATION =================

  Widget _obligationSwitch(CamReportGenerateController controller) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: controller.hasObligations.value,
            onChanged: (v) => controller.toggleObligations(v ?? false),
          ),
          const Expanded(
            child: Text(
              'Do you have monthly obligations? (EMIs, loans, etc.)',
              style: TextStyle(
                fontSize: 13,
                fontFamily: AppFonts.opensansRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _obligationAmount(CamReportGenerateController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label('Monthly Other Obligations Amount (₹) *'),
        const SizedBox(height: 8),
        TextField(
          controller: controller.obligationAmountController, // ✅ FIXED
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter total monthly obligated amount',
            prefixIcon: const Icon(Icons.currency_rupee),
            helperText:
                'Enter the total amount of your monthly EMIs, loans, or other fixed obligations',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          style: const TextStyle(fontFamily: AppFonts.opensansRegular),
        ),
      ],
    );
  }

  // ================= HELPERS =================

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.opensansRegular,
      ),
    );
  }
}
