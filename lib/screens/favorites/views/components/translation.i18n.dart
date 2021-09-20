import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "الرجاء المحاولة مجدداً ",
        "en": "Please try again",
      } +
      {
        "ar": "لا يوجد عناصر في المفضلة",
        "en": "No items yet ..",
      };

  String get i18n => localize(this, _t);
}
