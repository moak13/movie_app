import 'string_util.dart';

class Validator {
  static String? validateField(String? s, {String? errorMessage}) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage;
    } else {
      return null;
    }
  }
}
