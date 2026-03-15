class AppValidator {
  // 1. Name: Min 3 chars, letters only
  static String? validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Only letters allowed';
    }
    return null;
  }

  // 2. Email: Standard format
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
    }
    return null;
  }

  // 5. Phone: Egypt format (010, 011, 012, 015 + 8 digits)
  static String? validatePhone(String? value) {
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (value == null || !phoneRegex.hasMatch(value)) {
      return 'Enter a valid Egyptian phone number';
    }
    return null;
  }
}
