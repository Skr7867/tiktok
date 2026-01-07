import 'package:dsa/view/CustomerRegistration/customer_registration.dart';
import 'package:dsa/view/EmiCalculators/emi_calculators_screen.dart';
import 'package:dsa/view/FetchLoading/fetch_loading_screen.dart';
import 'package:dsa/view/GetCibilScore/summary_screen.dart';
import 'package:dsa/view/Home/home_screen.dart';
import 'package:dsa/view/Login/login_screen.dart';
import 'package:dsa/view/Notification/notification_screen.dart';
import 'package:dsa/view/Register/register_screen.dart';
import 'package:dsa/view/UserProfile/user_profile_screen.dart';
import 'package:get/get.dart';
import '../../view/GetCibilScore/LoanAccounts/loan_account_screen.dart';
import '../../view/GetCibilScore/get_cibil_score_screen.dart';
import '../../view/RegisterUser/register_user_screen.dart';
import '../../view/Splash/splash_screen.dart';
import '../../view/noInternet/network_base_screen.dart';
import 'routes_name.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => NetworkBasePage(child: SplashScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.loginscreen,
      page: () => NetworkBasePage(child: LoginScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.registerScreen,
      page: () => NetworkBasePage(child: RegisterScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => NetworkBasePage(child: HomeScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.customerRegistration,
      page: () => NetworkBasePage(child: CustomerRegistration()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.fetchCibilLoadingScreen,
      page: () => NetworkBasePage(child: FetchCibilLoadingScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.cibilScoreScreen,
      page: () => NetworkBasePage(child: GetCivilScoreScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.getRegisterUser,
      page: () => NetworkBasePage(child: RegisterUserScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.summaryReport,
      page: () => NetworkBasePage(child: SummaryScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.loanAccountScreen,
      page: () => NetworkBasePage(child: LoanAccountScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.notificationScreen,
      page: () => NetworkBasePage(child: NotificationScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.profileScreen,
      page: () => NetworkBasePage(child: ProfileScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.emiCalculators,
      page: () => NetworkBasePage(child: EmiCalculatorScreen()),
      transitionDuration: Duration(microseconds: 500),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
