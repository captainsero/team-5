class AppValidator {
  static String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // 3. Password: Matches your backend regex requirement
  static String? validatePassword(String? value) {
    final passRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );
    if (value == null || !passRegex.hasMatch(value)) {
      return 'Password needs uppercase, digit, and special char';
    }
    return null;
  }

  // 4. Confirm Password: Simple equality check
  static String? validateConfirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';

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

  // 5. Phone: Egypt format (010, 011, 012, 015 + 8 digits)
  static String? validatePhone(String? value) {
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (value == null || !phoneRegex.hasMatch(value)) {
      return 'Enter a valid Egyptian phone number';
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
