import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/overview_widget.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Loan Application Details',
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 360,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Application ID
                    Row(
                      children: [
                        const Text(
                          'Application ID:',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F3F5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '6964c07487254caae33e57ba',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    /// Created Date
                    const Text(
                      'Created: 12 Jan 2026',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    const SizedBox(height: 16),

                    /// Continue Stage 2 Button
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.check_box_outlined, size: 18),
                        label: const Text(
                          'Continue Stage 2',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2563EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// Eligibility Card
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0FFF4),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffBBF7D0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Eligible Title
                          Row(
                            children: const [
                              Icon(
                                Icons.check_circle,
                                color: Color(0xff16A34A),
                                size: 18,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Eligible for Loan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff166534),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'Based on your financial profile, you\'re eligible for up to ₹4,28,830',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff166534),
                            ),
                          ),

                          const SizedBox(height: 14),

                          /// Amount Box
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xffBBF7D0),
                              ),
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  '₹4,28,830',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff15803D),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Max Eligible Amount',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // **********************************************************here is the tab container ******************************
              LoanTabsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
