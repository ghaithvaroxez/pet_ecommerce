import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "هل أنت متأكد ؟",
        "en": "Are you sure ?",
      } +
      {
        "ar": "انت على وشك حذف هذه الخدمة !",
        "en": "You are going to delete this service !",
      } +
      {
        "ar": "نعم",
        "en": "Yes",
      } +
      {
        "ar": "لا",
        "en": "No",
      };

  String get i18n => localize(this, _t);
}
