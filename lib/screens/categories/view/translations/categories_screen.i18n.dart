import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "لا يوجد عناصر لعرضها حالياً",
        "en": "No items available now...",
      } +
      {
        "ar": "الأصناف",
        "en": "Categories",
      } +
      {
        "ar": "الرجاء المحاولة مرة اخرى ",
        "en": "Please try again ...",
      };

  String get i18n => localize(this, _t);
}
