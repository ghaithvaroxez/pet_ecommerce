import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar") +
      {
        "ar": "الدخول كزائر",
        "en": "Enter as a guest",
      }+ {
    "ar": " الرجاء المحاولة مجدداً",
    "en":   "Please try again",
  }
  +
      {
    "ar": "تسجيل دخول",
    "en":  "Sign in",
  }
  +
      {
    "ar": "إنشاء حساب",
    "en":  "Create an account",
  };

  String get i18n => localize(this, _t);
}
