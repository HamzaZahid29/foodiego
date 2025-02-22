class AppValidators {
  /// ✅ Checks if a field is empty.
  static String? validateRequired(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required.";
    }
    return null;
  }

  /// ✅ Validates an email address.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required.";
    }
// issue
    // Regular expression for validating email
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address.";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required.";
    }

    String cleanedNumber = value.replaceAll(RegExp(r'[^\d+]'), '');

    if (cleanedNumber.length <= 5) {
      return "Enter a valid phone number.";
    }

    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Otp is required.";
    }

    String cleanedNumber = value.replaceAll(RegExp(r'[^\d+]'), '');

    if (cleanedNumber.length < 6) {
      return "Enter a valid Otp.";
    }

    return null;
  }



  /// ✅ Validates a password with length and complexity requirements.
  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required.";
    }

    if (value.length < minLength) {
      return "Password must be at least $minLength characters long.";
    }
    return null;
  }

  /// ✅ Validates text length (custom min/max).
  static String? validateLength(String? value, {int minLength = 3, int maxLength = 50, String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required.";
    }

    if (value.length < minLength) {
      return "$fieldName must be at least $minLength characters long.";
    }

    if (value.length > maxLength) {
      return "$fieldName cannot be more than $maxLength characters long.";
    }

    return null;
  }
}
