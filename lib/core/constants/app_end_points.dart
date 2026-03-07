abstract class AppEndPoints {
  static const String baseUrl = "https://exam.elevateegy.com";
  static const String authBaseUrl = "https://exam.elevateegy.com/api/v1/auth";
  static const String forgetPassword = "$authBaseUrl/forgotPassword";
  static const String verifyResetCode = "$authBaseUrl/verifyResetCode";
  static const String resetPassword = "$authBaseUrl/resetPassword";
}
