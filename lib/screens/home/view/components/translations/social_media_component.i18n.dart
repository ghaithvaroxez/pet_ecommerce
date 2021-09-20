import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "عذرا لا يوجد رقم هاتف !",
        "en": "No phone number is exist !",
      } +
      {
        "ar": "عذرا لا يوجد رابط !",
        "en": "No url is exist !",
      } +
      {
        "ar": "عذراً يوجد مشكلة في الرابط",
        "en": "Sorry there is a problem in url !",
      } +
      {
        "ar": "عذراً يوجد مشكلة في الرقم",
        "en": "Sorry there is a problem in phone number !",
      } +
      {
        "ar": "مغلق الان",
        "en": "Closed now",
      };

  String get i18n => localize(this, _t);
}
