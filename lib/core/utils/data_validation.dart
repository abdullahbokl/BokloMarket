class DataValidation {
  /// Validate email
  static String? validateEmail(String email) {
    // Check if the email address is null or empty
    if (email.isEmpty) {
      return 'Email address is required';
    }

    // Define a regular expression for validating email addresses
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Use the RegExp hasMatch method to check if the email matches the pattern
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    // If no error was found, return null
    return null;
  }

  /// Validate password
  static String? validatePassword(String password) {
    // Check if the password is null or empty
    if (password.isEmpty) {
      return 'Password is required';
    }

    // Check if the password has a minimum length of 8 characters
    if (password.length < 8) {
      return 'Required at least 8 characters long';
    }

    // Check if the password contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Required at least one uppercase letter';
    }

    // Check if the password contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Required at least one lowercase letter';
    }

    // Check if the password contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Required at least one digit';
    }

    // If no error was found, return null
    return null;
  }

  /// Validate confirm password
  static String? validateConfirmPassword(
      {required String password, required String confirmPassword}) {
    // Check if the password and confirm password fields are empty
    if (confirmPassword.isEmpty) {
      return 'confirm password is required';
    }

    // Check if the password and confirm password fields match
    if (password != confirmPassword) {
      return 'Password and confirm password do not match';
    }

    // If no error was found, return null
    return null;
  }

  /// Validate name
  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }
    return null;
  }
}
