import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

import 'widgets/loan_list_screen.dart';

class CustomerLoanOverviewScreen extends StatelessWidget {
  const CustomerLoanOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Loan Eligibility',
        automaticallyImplyLeading: true,
      ),

      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.description,
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Customer Loan Application Overview",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.opensansRegular,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Manage and track all vehicle loan requests for this user.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontFamily: AppFonts.opensansRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// 🔹 NEW APPLICATION BUTTON
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("New Application"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// 🔹 STATUS CARDS GRID
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    StatusCard(
                      title: "TOTAL APPLICATION",
                      count: "6",
                      icon: Icons.description,
                      color: Color(0xff3B82F6),
                    ),
                    StatusCard(
                      title: "UNDER REVIEW",
                      count: "0",
                      icon: Icons.access_time,
                      color: Color(0xffFB923C),
                    ),
                    StatusCard(
                      title: "IN PROGRESS",
                      count: "2",
                      icon: Icons.show_chart,
                      color: Color(0xffA855F7),
                    ),
                    StatusCard(
                      title: "ELIGIBLE",
                      count: "6",
                      icon: Icons.check_circle,
                      color: Color(0xff10B981),
                    ),
                  ],
                ),
                // ****************************************here is the Loan List ****************************************//
                LoanListScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 REUSABLE STATUS CARD
class StatusCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  const StatusCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: Colors.white, size: 20),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      count,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.opensansRegular,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              /// Title
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
