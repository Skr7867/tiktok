import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/component/round_button.dart';
import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:dsa/res/custom_widgets/custome_textfield.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/viewModels/controllers/CustomerRegistration/customer_aadhar_send_verify_otp_controller.dart';
import 'package:dsa/viewModels/controllers/CustomerRegistration/location_controller.dart';
import 'package:dsa/viewModels/controllers/CustomerRegistration/pan_verify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModels/controllers/CustomerRegistration/customer_mobile_verify_controller.dart';
import '../../viewModels/controllers/CustomerRegistration/customer_registration_controller.dart';
import '../../viewModels/controllers/Theme/theme_controller.dart';

class CustomerRegistration extends StatelessWidget {
  const CustomerRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final customerRegistrationController = Get.put(
      CustomerRegistrationController(),
    );
    final customerMobileVerify = Get.put(CustomerMobileVerifyController());
    final customerAadharVerify = Get.put(
      CustomerAadharSendVerifyOtpController(),
    );
    final panVerifyController = Get.put(PanVerifyController());
    final locationVerifyController = Get.put(LocationController());
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;

    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        title: 'Customer Registration',
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.blackColor : AppColors.buttonColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DSA Customer Registration',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.helveticaBold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      textAlign: TextAlign.center,
                      'Complete customer profile for credit\nassessment',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontFamily: AppFonts.helveticaBold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.blackColor : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.2),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(.25))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('Aadhar Linked Mobile Number *'),
                    CustomTextField(
                      fillColor: isDark
                          ? AppColors.blackColor
                          : AppColors.loginContainerColor,
                      enabled: !customerMobileVerify.isPhoneVerified.value,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      controller: customerMobileVerify.phoneController,
                      prefixIcon: Icons.phone,
                      hintText: 'Enter 10-digit mobile..',
                      suffixIcon: Obx(
                        () => customerMobileVerify.isPhoneVerified.value
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Verified',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(height: 15),
                    _label("Customer's Complete Address *"),
                    Obx(() {
                      final canVerify = customerRegistrationController
                          .canVerifyLocation
                          .value;

                      return CustomTextField(
                        enabled: canVerify,
                        controller: locationVerifyController.locationController,
                        fillColor: isDark
                            ? AppColors.blackColor
                            : AppColors.loginContainerColor,
                        prefixIcon: Icons.location_on_outlined,
                        hintText:
                            'Enter complete address with city, state, and PIN code',
                        fontSize: 12,
                        suffixIcon: canVerify
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child:
                                    locationVerifyController
                                        .isLocationVerified
                                        .value
                                    ? Container(
                                        margin: const EdgeInsets.only(right: 4),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Verified',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          right: 4,
                                        ),
                                        child: RoundButton(
                                          fontSize: 11,
                                          width: 80,
                                          buttonColor: AppColors.blueColor,
                                          title: 'Verify',
                                          loading: locationVerifyController
                                              .isLoading
                                              .value,
                                          onPress: () {
                                            if (!locationVerifyController
                                                .isLoading
                                                .value) {
                                              locationVerifyController
                                                  .locationVerify(context);
                                            }
                                          },
                                        ),
                                      ),
                              )
                            : null, // ❌ no suffix when disabled
                      );
                    }),
                    SizedBox(height: 15),
                    _label('Aadhar Number *'),
                    Obx(() {
                      final canVerifyAadhar =
                          customerRegistrationController.canVerifyAadhar.value;

                      return CustomTextField(
                        enabled: canVerifyAadhar,
                        maxLength: 12,
                        controller: customerAadharVerify.aadharController,
                        prefixIcon: Icons.assignment_add,
                        hintText: "Enter 12-digit Aadhar number",
                        suffixIcon: canVerifyAadhar
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                child:
                                    customerAadharVerify.isAadharVerified.value
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Verified',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : RoundButton(
                                        loading: customerAadharVerify
                                            .isLoading
                                            .value,
                                        width: 80,
                                        buttonColor: AppColors.blueColor,
                                        title: 'Verify',
                                        onPress: () {
                                          if (!customerAadharVerify
                                              .isLoading
                                              .value) {
                                            customerAadharVerify.aadharSendOtp(
                                              context,
                                            );
                                          }
                                        },
                                      ),
                              )
                            : null,
                      );
                    }),
                    SizedBox(height: 15),
                    _label('PAN Number *'),
                    Obx(() {
                      final canVerifyPan =
                          customerRegistrationController.canVerifyPan.value;

                      return CustomTextField(
                        enabled: canVerifyPan, // 🔒 step control
                        controller: panVerifyController.panController,
                        prefixIcon: Icons.assignment_add,
                        hintText: "Enter PAN number",

                        suffixIcon: canVerifyPan
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                child: panVerifyController.isPanVerified.value
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Verified',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : RoundButton(
                                        loading:
                                            panVerifyController.isLoading.value,
                                        width: 80,
                                        buttonColor: AppColors.blueColor,
                                        title: 'Verify',
                                        onPress: () {
                                          if (!panVerifyController
                                              .isLoading
                                              .value) {
                                            panVerifyController.verifyPanCard(
                                              context,
                                            );
                                          }
                                        },
                                      ),
                              )
                            : null,
                      );
                    }),
                    SizedBox(height: 15),
                    _cibilConsent(customerRegistrationController),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Obx(() {
                final canSubmit =
                    customerRegistrationController.canSubmitCibil &&
                    customerRegistrationController.canVerifyPan.value;

                return RoundButton(
                  loading: customerRegistrationController.isLoading.value,
                  width: 330,
                  buttonColor: canSubmit
                      ? AppColors.blueColor
                      : AppColors.greyColor.withOpacity(0.6),
                  title: 'Check Customer Cibil Score',
                  onPress: canSubmit
                      ? () {
                          customerRegistrationController
                              .checkCustomerCibilScore();
                        }
                      : null,
                );
              }),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: AppFonts.opensansRegular,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _cibilConsent(CustomerRegistrationController controller) {
    return Obx(() {
      // Consent allowed only after PAN is verified
      final bool canGiveConsent = controller.canVerifyPan.value;

      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: canGiveConsent
                ? AppColors.greyColor.withOpacity(0.4)
                : AppColors.greyColor.withOpacity(0.2),
          ),
          color: canGiveConsent
              ? AppColors.whiteColor
              : AppColors.greyColor.withOpacity(0.05),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: canGiveConsent ? controller.agree.value : false,
              onChanged: canGiveConsent
                  ? (value) {
                      controller.agree.value = value ?? false;
                    }
                  : null,
              activeColor: AppColors.blueColor,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: canGiveConsent
                        ? AppColors.blackColor
                        : AppColors.greyColor,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                  children: const [
                    TextSpan(text: 'I agree to share my '),
                    TextSpan(
                      text: 'CIBIL ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.opensansRegular,
                      ),
                    ),
                    TextSpan(
                      text:
                          'score for loan verification.\nBy checking this box you authorize us to securely access your credit information for the purpose of determining your loan eligibility.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
