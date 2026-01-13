import 'package:dsa/res/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/enum/enum.dart';
import '../../../viewModels/controllers/Theme/theme_controller.dart';

class LoanTabsSection extends StatefulWidget {
  const LoanTabsSection({super.key});

  @override
  State<LoanTabsSection> createState() => _LoanTabsSectionState();
}

class _LoanTabsSectionState extends State<LoanTabsSection> {
  LoanTab selectedTab = LoanTab.overview;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 TABS CONTAINER
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isDark ? AppColors.blackColor : Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _tabItem(
                  icon: Icons.remove_red_eye_outlined,
                  title: 'Overview',
                  tab: LoanTab.overview,
                ),
                _tabItem(
                  icon: Icons.currency_rupee,
                  title: 'Financials',
                  tab: LoanTab.financials,
                ),
                _tabItem(
                  icon: Icons.receipt_long,
                  title: 'Payment History',
                  tab: LoanTab.paymentHistory,
                ),
                _tabItem(
                  icon: Icons.bar_chart,
                  title: 'Existing Loans',
                  tab: LoanTab.existingLoans,
                ),
                _tabItem(
                  icon: Icons.description_outlined,
                  title: 'Documents',
                  tab: LoanTab.documents,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// 🔹 TAB CONTENT
        _buildTabContent(),
      ],
    );
  }

  /// 🔹 Single Tab Widget
  Widget _tabItem({
    required IconData icon,
    required String title,
    required LoanTab tab,
  }) {
    final bool isSelected = selectedTab == tab;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tab;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff1677FF) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xff1677FF) : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Content based on selected tab
  Widget _buildTabContent() {
    switch (selectedTab) {
      case LoanTab.overview:
        return _contentBox();

      case LoanTab.financials:
        return _financialBox();

      case LoanTab.paymentHistory:
        return _contentBox();

      case LoanTab.existingLoans:
        return _contentBox();

      case LoanTab.documents:
        return _contentBox();
    }
  }

  Widget _financialBox() {
    return Column(children: [Text('Financials')]);
  }

  /// 🔹 Placeholder Content Box
  Widget _contentBox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 HEADER
                Row(
                  children: const [
                    Icon(Icons.show_chart, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Loan Calculation Analysis',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// 🔹 INFO NOTE
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFFFE082)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.info_outline, color: Colors.orange, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Calculations based on Stage 1 data, assuming '
                          '10% interest for 12 months tenure.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// 🔹 METRICS
                _metricCard(
                  title: 'Max Eligible Loan Amount',
                  value: '₹4,28,830',
                  valueColor: Colors.blue,
                  icon: Icons.currency_rupee,
                  iconBg: const Color(0xFFE3F2FD),
                ),

                _metricCard(
                  title: 'Available EMI Capacity',
                  value: '₹37,701',
                  valueColor: Colors.green,
                  icon: Icons.trending_up,
                  iconBg: const Color(0xFFE8F5E9),
                ),

                _metricCard(
                  title: 'Current EMI Commitments',
                  value: '₹799',
                  valueColor: Colors.red,
                  icon: Icons.remove_circle_outline,
                  iconBg: const Color(0xFFFFEBEE),
                ),

                _metricCard(
                  title: 'Available for EMI',
                  value: '₹38,500',
                  valueColor: Colors.deepPurple,
                  icon: Icons.calendar_month,
                  iconBg: const Color(0xFFF3E5F5),
                ),
              ],
            ),
          ),
        ),
        _customerInformationCard(),
        loanRequestAndTimelineCard(),
      ],
    );
  }

  Widget loanRequestAndTimelineCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 LOAN REQUEST HEADER
          Row(
            children: const [
              Icon(Icons.currency_rupee, size: 18),
              SizedBox(width: 6),
              Text(
                'Loan Request',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 REQUESTED AMOUNT
          Center(
            child: Column(
              children: const [
                Text(
                  'Requested Amount',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  '₹9,99,999',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// 🔹 TENURE
          _loanRow(
            icon: Icons.calendar_today_outlined,
            label: 'Tenure',
            value: '12 months',
          ),

          const SizedBox(height: 8),

          /// 🔹 EMI
          _loanRow(
            icon: Icons.receipt_long_outlined,
            label: 'Estimated EMI',
            value: '₹87,916/month',
            valueColor: Colors.green,
            subText: '@15% interest',
          ),

          const SizedBox(height: 8),

          /// 🔹 DTI
          _loanRow(
            icon: Icons.percent,
            label: 'Debt to Income Ratio',
            value: '1.14%',
            valueColor: Colors.blue,
          ),

          const SizedBox(height: 12),

          /// 🔹 TOTALS
          Row(
            children: [
              Expanded(
                child: _amountPill(
                  title: 'Total Interest',
                  value: '₹54,993',
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _amountPill(
                  title: 'Total Payment',
                  value: '₹10,54,992',
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// 🔹 APPLICATION TIMELINE
          Row(
            children: const [
              Icon(Icons.schedule, size: 18),
              SizedBox(width: 6),
              Text(
                'Application Timeline',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _timelineItem(
            title: 'Stage 1: Basic Details',
            status: 'Completed',
            date: '12 Jan 2026',
            isCompleted: true,
          ),

          _timelineItem(
            title: 'Stage 2: Additional Details',
            status: 'In Progress',
          ),

          _timelineItem(title: 'Stage 3: Submitted', status: 'In Progress'),

          const SizedBox(height: 16),

          /// 🔹 STATUS ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statusBlock(
                title: 'Current Status',
                value: 'Stage1_BasicDetails',
                color: Colors.blue,
              ),
              _statusBlock(
                title: 'Final Decision',
                value: 'Pending',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loanRow({
    required IconData icon,
    required String label,
    required String value,
    Color valueColor = Colors.black,
    String? subText,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: valueColor,
              ),
            ),
            if (subText != null)
              Text(
                subText,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
          ],
        ),
      ],
    );
  }

  Widget _amountPill({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timelineItem({
    required String title,
    required String status,
    String? date,
    bool isCompleted = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    color: isCompleted ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (date != null)
            Text(
              date,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
        ],
      ),
    );
  }

  Widget _statusBlock({
    required String title,
    required String value,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _customerInformationCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 HEADER
          Row(
            children: const [
              Icon(Icons.person_outline, size: 20),
              SizedBox(width: 8),
              Text(
                'Customer Information',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 USER HEADER
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue,
                child: const Text(
                  'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'SATYAM KUMAR',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Applicant',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 INFO GRID
          Row(
            children: [
              Expanded(
                child: _infoTile(
                  icon: Icons.work_outline,
                  title: 'Occupation',
                  value: 'Salaried',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _infoTile(
                  icon: Icons.currency_rupee,
                  title: 'Monthly Income',
                  value: '₹70,000',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _infoTile(
                  icon: Icons.percent,
                  title: 'Credit Utilization',
                  value: '0%',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _infoTile(
                  icon: Icons.badge_outlined,
                  title: 'PAN Number',
                  value: 'INEPK3169K',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _infoTile(
                  icon: Icons.phone_outlined,
                  title: 'Phone Number',
                  value: '7505576025',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _infoTile(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  value: 'N/A',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricCard({
    required String title,
    required String value,
    required Color valueColor,
    required IconData icon,
    required Color iconBg,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: valueColor),
          ),

          const SizedBox(width: 12),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: valueColor,
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
