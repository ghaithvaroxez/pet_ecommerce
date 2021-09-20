import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "الاشعارات",
        "en": "Notifications",
      } +
      {
        "ar": "الرجاء المحاولة مجددا",
        "en": "Please try again",
      } +
      {
        "ar": "عام",
        "en": "General",
      } +
      {
        "ar": "عروض",
        "en": "Offers",
      } +
      {
        "ar": "متاجر",
        "en": "Stores",
      } +
      {
        "ar": "اسطبلات",
        "en": "Stables",
      } +
      {
        "ar": "مناحل",
        "en": "Sieve",
      } +
      {
        "ar": "طلبات",
        "en": "Orders",
      } +
      {
        "ar": "النوع",
        "en": "Type",
      } +
      {
        "ar": "لا يوجد عناصر لعرضها حاليا",
        "en": "No item available ...",
      };

  String get i18n => localize(this, _t);
}
