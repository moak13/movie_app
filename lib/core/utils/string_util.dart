class StringUtil {
  static bool isEmpty(String? s) {
    return s == null || s.isEmpty;
  }

  static bool isNotEmpty(String? s) {
    return s != null && s.isNotEmpty;
  }

  static bool hasUpperCase(String password) {
    return RegExp('(?:[A-Z])').hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp('(?:[a-z])').hasMatch(password);
  }
}
