import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/component/round_button.dart';
import 'package:dsa/res/custom_widgets/custome_appbar.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModels/controllers/RegisteredUser/registered_user_controller.dart';
import '../../viewModels/controllers/Theme/theme_controller.dart';
import '../SkeltonBox/cam_report_skelton.dart';

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({super.key});

  final RegisteredUserController controller = Get.put(
    RegisteredUserController(),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Registered User',
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Obx(() {
        /// 🔹 LOADING STATE
        if (controller.isLoading.value) {
          return CamReportSkeleton(isTablet: isTablet);
        }

        final users = controller.filteredUsers;

        Widget _buildSearchBar(bool isDark) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                controller.searchText.value = value;
              },
              decoration: InputDecoration(
                hintText: 'Search by name or phone',
                hintStyle: TextStyle(
                  fontFamily: AppFonts.opensansRegular,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                filled: true,
                fillColor: isDark
                    ? AppColors.blackColor.withOpacity(0.2)
                    : Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),

                // IMPORTANT PART
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.greyColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.greyColor.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.greyColor.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          );
        }

        /// 🔹 USER LIST
        return Column(
          children: [
            _buildSearchBar(isDark),

            Expanded(
              child: users.isEmpty
                  ? const Center(
                      child: Text(
                        'No Registered users found',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];

                        final name = user.name ?? 'N/A';
                        final phone = user.phone?.toString() ?? '-';
                        final userId = user.sId;

                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.blackColor : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.greyColor.withOpacity(0.2),
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.blueColor.withOpacity(
                                0.1,
                              ),
                              child: Text(
                                name.isNotEmpty ? name[0].toUpperCase() : 'U',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blueColor,
                                  fontFamily: AppFonts.opensansRegular,
                                ),
                              ),
                            ),
                            title: Text(
                              name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.opensansRegular,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                              ),
                            ),
                            subtitle: Text(
                              phone,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.greyColor,
                              ),
                            ),
                            trailing: RoundButton(
                              onPress: userId == null
                                  ? null
                                  : () {
                                      Get.toNamed(
                                        RouteName.cibilScoreScreen,
                                        arguments: {'userId': userId},
                                      );
                                    },
                              buttonColor: AppColors.blueColor,
                              height: 30,
                              width: 90,
                              fontSize: 12,
                              title: 'See More',
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}
