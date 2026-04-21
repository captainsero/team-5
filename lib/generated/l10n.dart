// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a Valid email`
  String get enterAValidEmail {
    return Intl.message(
      'Enter a Valid email',
      name: 'enterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters and include upper, lower, number and special character`
  String get passwordMustBe {
    return Intl.message(
      'Password must be at least 8 characters and include upper, lower, number and special character',
      name: 'passwordMustBe',
      desc: '',
      args: [],
    );
  }

  /// `Code is required`
  String get codeIsRequired {
    return Intl.message(
      'Code is required',
      name: 'codeIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code`
  String get invalidCode {
    return Intl.message(
      'Invalid code',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get pleaseConfirmPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'pleaseConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match`
  String get passwordDoNotMatch {
    return Intl.message(
      'Password do not match',
      name: 'passwordDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwrod {
    return Intl.message('Password', name: 'passwrod', desc: '', args: []);
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email associated to your account`
  String get forgetPasswordDis {
    return Intl.message(
      'Please enter your email associated to your account',
      name: 'forgetPasswordDis',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Email verification`
  String get emailVerification {
    return Intl.message(
      'Email verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your code that send to your email address`
  String get emailVerificationDis {
    return Intl.message(
      'Please enter your code that send to your email address',
      name: 'emailVerificationDis',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code? `
  String get didnotReceiveCode {
    return Intl.message(
      'Didn\'t receive code? ',
      name: 'didnotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must not be empty and must contain 6 characters with upper case letter and one number at least`
  String get resetPasswordDis {
    return Intl.message(
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least',
      name: 'resetPasswordDis',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your passwrod`
  String get enterYourPassword {
    return Intl.message(
      'Enter your passwrod',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Request timed out. Please check your internet connection.`
  String get connectionTimeout {
    return Intl.message(
      'Request timed out. Please check your internet connection.',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Server error. Please try again later.`
  String get serverError {
    return Intl.message(
      'Server error. Please try again later.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Requested resource not found.`
  String get notFound {
    return Intl.message(
      'Requested resource not found.',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get errorMessageGeneric {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'errorMessageGeneric',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your connection.`
  String get networkError {
    return Intl.message(
      'Network error. Please check your connection.',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again.`
  String get requestTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'requestTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Login successful! Welcome`
  String get loginSuccessful {
    return Intl.message(
      'Login successful! Welcome',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message('User name', name: 'userName', desc: '', args: []);
  }

  /// `Enter your user name`
  String get enterYourUserName {
    return Intl.message(
      'Enter your user name',
      name: 'enterYourUserName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Enter your first name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter your first name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter your last name`
  String get enterYourLastName {
    return Intl.message(
      'Enter your last name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone {
    return Intl.message('Phone number', name: 'phone', desc: '', args: []);
  }

  /// `Enter your phone number`
  String get enterYourPhone {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Exam`
  String get exam {
    return Intl.message('Exam', name: 'exam', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Exam Score`
  String get examScore {
    return Intl.message('Exam Score', name: 'examScore', desc: '', args: []);
  }

  /// `Your Score`
  String get yourScore {
    return Intl.message('Your Score', name: 'yourScore', desc: '', args: []);
  }

  /// `Correct`
  String get correct {
    return Intl.message('Correct', name: 'correct', desc: '', args: []);
  }

  /// `Incorrect`
  String get incorrect {
    return Intl.message('Incorrect', name: 'incorrect', desc: '', args: []);
  }

  /// `Show results`
  String get showResults {
    return Intl.message(
      'Show results',
      name: 'showResults',
      desc: '',
      args: [],
    );
  }

  /// `Start again`
  String get startAgain {
    return Intl.message('Start again', name: 'startAgain', desc: '', args: []);
  }

  /// `Time out !!`
  String get timeOut {
    return Intl.message('Time out !!', name: 'timeOut', desc: '', args: []);
  }

  /// `View score`
  String get viewScore {
    return Intl.message('View score', name: 'viewScore', desc: '', args: []);
  }

  /// `Answers not ready yet`
  String get answersNotReady {
    return Intl.message(
      'Answers not ready yet',
      name: 'answersNotReady',
      desc: '',
      args: [],
    );
  }

  /// `No questions found`
  String get noQuestionsFound {
    return Intl.message(
      'No questions found',
      name: 'noQuestionsFound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
