import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:flutter/material.dart';

class LoanAccountScreen extends StatelessWidget {
  const LoanAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Loan Accounts',
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Text('Loan accounts'),
          ],
        ),
      ),
    );
  }
}
