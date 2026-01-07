import 'dart:async';
import 'package:get/get.dart';
import '../../res/routes/routes_name.dart';
import '../services/user_session_service.dart';

class SplashServices {
  final UserSessionService _session = UserSessionService();

  void isLogin() {
    Timer(const Duration(seconds: 1), () {
      if (_session.isLoggedIn) {
        Get.offAllNamed(RouteName.homeScreen);
      } else {
        Get.offAllNamed(RouteName.loginscreen);
      }
    });
  }
}
