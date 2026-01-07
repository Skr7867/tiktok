import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/color/app_colors.dart';
import '../../res/fonts/app_fonts.dart';
import '../../viewModels/controllers/CustomerRegistration/customer_registration_controller.dart';

class FetchCibilLoadingScreen extends StatelessWidget {
  const FetchCibilLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CustomerRegistrationController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delivery_dining,
              size: 100,
              color: AppColors.blueColor,
            ),
            const SizedBox(height: 20),
            Text(
              'Fetching your CIBIL Score...',
              style: TextStyle(
                fontSize: 18,
                fontFamily: AppFonts.opensansRegular,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Please wait while we check your credit profile',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: AppFonts.opensansRegular,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
