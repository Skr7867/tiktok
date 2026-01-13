class ApiUrls {
  static const String baseUrl = 'https://dsa-backend-7f4z.onrender.com';
  static const String sendOtpApi = '$baseUrl/api/partner/send-registration-otp';
  static const String verifyOtpApi =
      '$baseUrl/api/partner/verify-registration-otp';

  static const String userRegisterApi =
      '$baseUrl/api/partner/registerPartnerReq';
  static const String loginSendOtp = '$baseUrl/api/partner/login-send-otp';
  static const String loginVerifyOtp = '$baseUrl/api/partner/login-verify-otp';

  static const String mobileSendOtp = '$baseUrl/api/user/registerDP/start';
  static const String mobileVerifyOtp =
      '$baseUrl/api/user/registerDP/verify-phone';
  static const String aadharSendOtp = '$baseUrl/api/user/registerDP/aadhar';
  static const String aadharVerifyOtp =
      '$baseUrl/api/user/registerDP/verify-aadhar';

  static const String panVerifyOtp = '$baseUrl/api/user/registerDP/pan';
  static const String customerConsentApi =
      '$baseUrl/api/user/registerDP/complete';
  static const String locationApi = '$baseUrl/api/user/registerDP/location';
  static const String fetchCibiScoreApi = '$baseUrl/api/cibil/submitReport';
  static const String getCustomerCibilScoreApi = '$baseUrl/api/cibil/report';
  static const String registeredUserApi =
      '$baseUrl/api/dealer/getRegisteredUsers';
  static const String userProfile = '$baseUrl/api/partner/profile';
  static const String loanListApi = '$baseUrl/api/loanRequest/user';
  static const String checkLoanEligibilityStage1Api =
      '$baseUrl/api/loanRequest/stage1';

  static const String loanApplicationDetailsApi = '$baseUrl/api/loanRequest';
}
