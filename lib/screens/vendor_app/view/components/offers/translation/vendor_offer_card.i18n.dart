import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": 'هل أنت متأكد ؟',
        "en": "Are you sure?",
      } +
      {
        "ar": 'انت على وشك حذف هذا العرض !',
        "en": "You are about to delete this offer !",
      } +
      {
        "ar": 'نعم',
        "en": "Yes",
      } +
      {
        "ar": 'لا',
        "en": "No",
      } +
      {
        "ar": "العرض منشور اساساً",
        "en": "offer already un uploaded",
      } +
      {
        "ar": "العرض غير منشور اساساً ",
        "en": "offer already  uploaded",
      };

  String get i18n => localize(this, _t);
}
