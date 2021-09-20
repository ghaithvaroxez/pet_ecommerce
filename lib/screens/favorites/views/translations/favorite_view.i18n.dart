import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "المفضلة",
        "en": "Favorite",
      } +
      {
        "ar": "المنتجات",
        "en": "Products",
      } +
      {
        "ar": "المتاجر",
        "en": "Stores",
      } +
      {
        "ar": "الأطباء",
        "en": "Doctors",
      } +
      {
        "ar": "الاسطبلات",
        "en": "Barns",
      } +
      {
        "ar": "المناحل",
        "en": "Sieves",
      } +
      {
        "ar": "العروض",
        "en": "Offers",
      };

  String get i18n => localize(this, _t);
}
