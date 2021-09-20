import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": "can't change product status now try again later",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": "can't add your product now try again later",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": "can't delete your product now try again later",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": "can't edit your product now try again later",
      };

  String get i18n => localize(this, _t);
}
