import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Notification',
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'No Notification Found',
                style: TextStyle(
                  fontFamily: AppFonts.opensansRegular,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
