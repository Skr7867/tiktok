import 'package:dsa/data/hive/loginResponse/login_response_hive.dart';
import 'package:dsa/data/hive/partener/partner_hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/network/dio_client.dart';
import 'res/routes/routes.dart';
import 'viewModels/controllers/Network/network_controller.dart';
import 'viewModels/controllers/Theme/theme_controller.dart';
import 'viewModels/services/user_session_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DioClient.init();
  Hive.registerAdapter(LoginResponseHiveAdapter());
  Hive.registerAdapter(PartnerHiveAdapter());

  await Hive.openBox<LoginResponseHive>('userBox');
  await GetStorage.init();
  Get.put(ThemeController(), permanent: true);
  Get.put(NetworkController(), permanent: true);
  Get.put(UserSessionService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
