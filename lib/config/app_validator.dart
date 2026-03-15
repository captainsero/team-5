class AppValidator {
  // ✅ Email validation
  static String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // ✅ Password validation (matches backend regex)
  static String? validatePassword(String? value) {
    final passRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );
    if (value == null || !passRegex.hasMatch(value)) {
      return 'Password needs uppercase, digit, and special char';
    }
    return null;
  }

  // ✅ Confirm Password (equality check only)
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // ✅ OTP validation (6 digits)
  static String? validateOtpCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Code is required';
    }
    if (value.length != 6) {
      return 'Invalid code';
    }
    return null;
  }

  // ✅ Egyptian phone (01[0125]xxxxxxxx)
  static String? validatePhone(String? value) {
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (value == null || !phoneRegex.hasMatch(value)) {
      return 'Enter a valid Egyptian phone number';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Only letters allowed';
    }
    return null;
  }
}
