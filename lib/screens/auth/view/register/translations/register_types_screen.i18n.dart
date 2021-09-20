import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "إنشاء حساب",
        "en": "Create an account ",
      } +
      {
        "ar": "كمستخدم",
        "en": "As a user",
      } +
      {
        "ar": "كصاحب متجر",
        "en": "As a store ",
      } +
      {
        "ar": "كصاحب اسطبل",
        "en": "As a barn",
      } +
      {
        "ar": "كصاحب منحلة",
        "en": "As a sieve",
      } +
      {
        "ar": "كطبيب بيطري",
        "en": "As a doctor",
      };

  String get i18n => localize(this, _t);
}
