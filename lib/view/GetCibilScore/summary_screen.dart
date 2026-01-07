import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:flutter/material.dart';

import 'Widgets/cibil_summary_card_widget.dart';
import 'Widgets/recent_enquery_section.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Summary',
        automaticallyImplyLeading: true,
      ),
      body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                CibilSummaryCards(),
                RecentEnquiriesSection(),
              ],
            ),
          )),
    );
  }
}
