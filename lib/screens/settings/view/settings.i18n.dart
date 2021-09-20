import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "الإعدادات",
        "en": "Settings",
      } +
      {
        "ar": "استقبال الإشعارات",
        "en": "Notifications",
      } +
      {"ar": "اللغة", "en": "Language"} +
      {"ar": "إشعارات العروض", "en": "Offers notification"} +
      {"ar": 'إشعارات المتاجر', "en": "Stores notification"} +
      {"ar": 'إشعارات الاسطبلات', "en": "Stables notification"} +
      {"ar": 'إشعارات المناحل', "en": "Sieves notification"} +
      {"ar": "الرجاء المحاولة مجدداً", "en": "Please try again"} +
      {"ar": "إشعارات الطلبات", "en": "Orders notifications"};

  String get i18n => localize(this, _t);
}
