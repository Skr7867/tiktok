import 'package:dsa/data/hive/loginResponse/login_response_hive.dart';
import 'package:dsa/res/color/app_colors.dart';
import 'package:dsa/res/component/round_button.dart';
import 'package:dsa/res/fonts/app_fonts.dart';
import 'package:dsa/view/Logout/log_out_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/document_opener.dart';
import '../../utils/utils.dart';
import '../../viewModels/controllers/Theme/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  String formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return '-';

    final date = DateTime.tryParse(isoDate);
    if (date == null) return isoDate;

    return '${date.day} ${_monthName(date.month)} ${date.year}';
  }

  String _monthName(int m) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    if (m < 1 || m > 12) return '';
    return months[m - 1];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<LoginResponseHive>('userBox').listenable(),
        builder: (context, box, _) {
          final user = box.get('user');
          final profile = user?.partner;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔵 TOP HEADER
                Container(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff2B77E5), Color(0xff1B5FCC)],
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile?.name ?? 'Partner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: AppFonts.opensansRegular,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: AppColors.greenColor,
                              size: 20,
                            ),
                            SizedBox(width: 2),
                            Text(
                              profile?.isApproved ?? 'Approved',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.opensansRegular,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                _sectionTitle('Personal Information'),

                _infoCard(
                  icon: Icons.email,
                  title: 'Email Address',
                  value: profile?.email ?? '',
                  color: Colors.blue,
                ),

                _infoCard(
                  icon: Icons.call,
                  title: 'Phone Number',
                  value: profile?.phone ?? '',
                  color: Colors.green,
                ),

                _infoCard(
                  icon: Icons.badge,
                  title: 'Role',
                  value: profile?.role ?? '',
                  color: Colors.orange,
                ),
                _infoCard(
                  icon: Icons.badge,
                  title: 'Registration type',
                  value: profile?.registrationType ?? 'Professional Partner',
                  color: Colors.blue,
                ),
                _infoCard(
                  icon: Icons.location_on,
                  title: 'Location',
                  value: profile?.location ?? '',
                  color: Colors.purple,
                ),

                _sectionTitle('Account Information'),

                _infoCard(
                  icon: Icons.calendar_today,
                  title: 'Member Since',
                  value: formatDate(profile?.createdAt),
                  color: Colors.blue,
                ),

                _infoCard(
                  icon: Icons.update,
                  title: 'Last Updated',
                  value: formatDate(profile?.updatedAt),
                  color: Colors.purple,
                ),

                _infoCard(
                  icon: Icons.verified_user,
                  title: 'Account Status',
                  value: 'Active',
                  color: Colors.green,
                ),

                _infoCard(
                  icon: Icons.group,
                  title: 'Registered Users',
                  value: profile?.registeredUsersCount.toString() ?? '0',
                  color: Colors.deepOrange,
                ),

                if (profile?.registrationType != 'individual') ...[
                  _sectionTitle('Documents & Verification'),

                  amoDocumentCard(
                    Color: const Color.fromARGB(255, 213, 242, 255),
                    title: 'AMU Document',
                    fileName: 'amu_document.pdf',
                    onViewTap: () async {
                      final box = Hive.box<LoginResponseHive>('userBox');
                      final user = box.get('user');
                      final url = user?.partner?.businessDocumentUrl;

                      try {
                        await DocumentOpener.openPdf(url);
                      } catch (e) {
                        Utils.snackBar('Failed to Open Document', 'Failed');
                      }
                    },
                  ),

                  amoDocumentCard(
                    Color: const Color.fromARGB(255, 246, 253, 240),
                    title: 'AMO Document',
                    fileName: 'amo_document.pdf',
                    onViewTap: () async {
                      final box = Hive.box<LoginResponseHive>('userBox');
                      final user = box.get('user');
                      final url = user?.partner?.businessDocumentUrl;

                      try {
                        await DocumentOpener.openPdf(url);
                      } catch (e) {
                        Utils.snackBar('Failed to Open Document', 'Failed');
                      }
                    },
                  ),

                  documentStatusCard(
                    'All documents are verified and approved by the administration team',
                  ),
                ],

                SizedBox(height: 20),
                // EDIT PROFILE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundButton(
                    height: 40,
                    title: 'Edit Profile',
                    buttonColor: AppColors.blueColor,
                    width: double.infinity,
                    onPress: () {},
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundButton(
                    height: 40,
                    buttonColor: AppColors.redColor,
                    title: 'Logout',
                    textColor: AppColors.redColor,
                    width: double.infinity,
                    onPress: () {
                      showLogoutDialog(context);
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.opensansRegular,
        ),
      ),
    );
  }

  Widget amoDocumentCard({
    required String title,
    required String fileName,
    required VoidCallback onViewTap,
    required Color Color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.description_outlined, color: Colors.green),
          ),

          const SizedBox(width: 12),

          /// Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  fileName,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    fontFamily: AppFonts.opensansRegular,
                  ),
                ),
              ],
            ),
          ),

          /// Actions
          Column(
            children: [
              const Icon(Icons.open_in_new, size: 18, color: Colors.grey),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onViewTap,
                child: Row(
                  children: const [
                    Icon(Icons.download, size: 18, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      'View',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.opensansRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget documentStatusCard(String message) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F6FF), // light blue
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.verified_user_outlined, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Document Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: TextStyle(color: Colors.blue.shade700, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    final themeController = Get.find<ThemeController>();
    final bool isDark = themeController.isDarkMode.value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          // color: color.withOpacity(0.08),
          color: isDark ? AppColors.blackColor : color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.opensansRegular,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: AppFonts.opensansRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
