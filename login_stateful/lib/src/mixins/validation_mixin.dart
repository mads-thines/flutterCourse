class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Your email must contain an @';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
