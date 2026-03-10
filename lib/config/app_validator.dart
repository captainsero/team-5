class AppValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // At least 8 chars, 1 upper, 1 lower, 1 digit, 1 special
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*\-]).{8,}$',
    );

    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters and include upper, lower, number and special character';
    }

    return null;
  }

  static String? validateOtpCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Code is required';
    }
    if (value.length != 6) {
      return 'Invalid code';
    }
    return null;
  }

  static String? validateConfirmPasswrod(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
