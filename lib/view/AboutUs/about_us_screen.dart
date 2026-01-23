import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/color/app_colors.dart';
import '../../viewModels/controllers/Theme/theme_controller.dart';
import 'widgets/loanzo_why_us_screen.dart';
import 'widgets/maximize_earning_card.dart';
import 'widgets/partener_section_widget.dart';
import 'widgets/partner_advantages_screen.dart';
import 'widgets/start_earning_steps_screen.dart' show StartEarningStepsScreen;

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: CustomAppBar(title: 'About Us', automaticallyImplyLeading: true),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 32 : 20,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ================= Header =================
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Welcome to Your ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.opensansRegular,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    children: [
                      TextSpan(
                        text: 'LoanZo\nPartner',
                        style: TextStyle(
                          color: Color(0xFF2563EB),
                          fontFamily: AppFonts.opensansRegular,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  'Start earning today! Your single platform to\n'
                  'access 50+ banking partners and earn up to '
                  '2.5% commission on every vehicle loan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 15 : 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),

                const SizedBox(height: 20),

                // ================= Buttons =================
                _primaryButton(
                  title: 'Register Customer & Earn Now',
                  icon: Icons.person_add_alt_1,
                  onTap: () {
                    Get.toNamed(RouteName.customerRegistration);
                  },
                ),

                const SizedBox(height: 12),

                _outlineButton(
                  title: 'View Commission Plans',
                  icon: Icons.show_chart,
                  onTap: () {},
                ),

                const SizedBox(height: 32),

                // ================= Stats Cards =================
                _statCard(
                  icon: Icons.groups,
                  iconColor: const Color(0xFF2563EB),
                  title: '12,500+',
                  subtitle: 'Active Partners',
                  description: 'Successful financial partners across India',
                ),

                _statCard(
                  icon: Icons.currency_rupee,
                  iconColor: const Color(0xFF22C55E),
                  title: '₹525Cr+',
                  subtitle: 'Loan Disbursed',
                  description:
                      'Total vehicle loans facilitated through partners',
                ),

                _statCard(
                  icon: Icons.apartment,
                  iconColor: const Color(0xFF3B82F6),
                  title: '50+',
                  subtitle: 'Banking Partners',
                  description: 'Leading banks & NBFCs in our network',
                ),

                _statCard(
                  icon: Icons.flash_on,
                  iconColor: const Color(0xFFFACC15),
                  title: '95%',
                  subtitle: 'Approval Rate',
                  description: 'Industry-leading approval success',
                ),
                //*********************************************here is the widget import *************************** */
                PartnerBanksSection(),
                LoanzoWhyUsScreen(),
                PartnerAdvantageScreen(),
                StartEarningStepsScreen(),
                MaximizeEarningsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= Primary Button =================
  Widget _primaryButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.opensansRegular,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // ================= Outline Button =================
  Widget _outlineButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20, color: const Color(0xFF2563EB)),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2563EB),
            fontFamily: AppFonts.opensansRegular,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF2563EB)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // ================= Stat Card =================
  Widget _statCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String description,
  }) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 2),
        // ],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2563EB),
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontFamily: AppFonts.opensansRegular,
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
