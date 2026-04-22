import 'package:team_5_examapp/core/constants/base_urls.dart';

abstract class AppEndPoints {
  static const String _baseUrl = BaseUrls.baseUrl;
  static const String forgetPassword = "$_baseUrl/auth/forgotPassword";
  static const String verifyResetCode = "$_baseUrl/auth/verifyResetCode";
  static const String resetPassword = "$_baseUrl/auth/resetPassword";
  static const String signin = "$_baseUrl/auth/signin";
  static const String signUp = "$_baseUrl/auth/signup";
  static const String getAllSubjects = "$_baseUrl/subjects";
  static const String questions = "$_baseUrl/questions";
  static const String checkQuestions = "$_baseUrl/questions/check";
  static const String exams = "$_baseUrl/exams";
}
