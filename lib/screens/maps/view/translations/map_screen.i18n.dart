import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "الخريطة",
        "en": "Map",
      } +
      {
        "ar": "متاجر",
        "en": "Stores",
      } +
      {
        "ar": "أطباء",
        "en": "Doctors",
      };

  String get i18n => localize(this, _t);
}
