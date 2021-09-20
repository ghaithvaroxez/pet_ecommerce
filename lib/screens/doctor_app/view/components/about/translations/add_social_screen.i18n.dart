import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "فيسبوك",
        "en": "facebook",
      } +
      {
        "ar": "انستغرام",
        "en": "instagram",
      } +
      {
        "ar": "واتساب",
        "en": "whatsapp",
      } +
      {
        "ar": "اضافة معلومات التواصل الاجتماعي",
        "en": "Add socialMedia Information",
      } +
      {
        "ar": "النوع",
        "en": "Type",
      } +
      {
        "ar": "الرابط",
        "en": "Link",
      } +
      {
        "ar": "لم تقم باختيار النوع ",
        "en": "you don't enter any type",
      } +
      {
        "ar": "لم تقم باضافة رابط ",
        "en": "you don't enter any link",
      } +
      {
        "ar": "حفظ ومتابعة ",
        "en": "Save & Continue",
      } +
      {
        "ar": "حذف ",
        "en": "Delete",
      };

  String get i18n => localize(this, _t);
}
