import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/color/app_colors.dart';
import '../../../viewModels/controllers/Theme/theme_controller.dart';

class PartnerBanksSection extends StatelessWidget {
  const PartnerBanksSection({super.key});

  static const List<_BankItem> _banks = [
    _BankItem('HDFC Bank', Icons.account_balance),
    _BankItem('ICICI Bank', Icons.account_balance),
    _BankItem('Axis Bank', Icons.account_balance),
    _BankItem('Kotak Mahindra', Icons.account_balance),
    _BankItem('Yes Bank', Icons.account_balance),
    _BankItem('IndusInd Bank', Icons.account_balance),
    _BankItem('Tata Capital', Icons.account_balance),
    _BankItem('Bajaj Finance', Icons.account_balance),
    _BankItem('Mahindra Finance', Icons.account_balance),
    _BankItem('Cholamandalam', Icons.account_balance),
  ];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 32 : 1,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ================= Title =================
          const Text(
            "Partner With India's Top Banks",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          Text(
            'Access 50+ leading banks and financial institutions\n'
            'through your single dashboard',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 24),

          // ================= Banks Grid =================
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _banks.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 3 : 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              mainAxisExtent: 125,
            ),
            itemBuilder: (context, index) {
              return _BankCard(bank: _banks[index]);
            },
          ),
        ],
      ),
    );
  }
}

// ================= Bank Card =================
class _BankCard extends StatelessWidget {
  final _BankItem bank;

  const _BankCard({required this.bank});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? AppColors.blackColor : Colors.white,
        border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Placeholder
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.account_balance,
              color: Color(0xFF2563EB),
              size: 22,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            bank.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.opensansRegular,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= Model =================
class _BankItem {
  final String name;
  final IconData icon;

  const _BankItem(this.name, this.icon);
}
