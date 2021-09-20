import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "تعديل منتج ",
        "en": "Edit product",
      } +
      {
        "ar": "تعديل المنتج ",
        "en": "Edit your product",
      } +
      {
        "ar": "الصنف",
        "en": "Category",
      } +
      {
        "ar": "النوع",
        "en": "Type",
      } +
      {
        "ar": "اسم المنتج",
        "en": "Product name",
      } +
      {
        "ar": "صورة المنتج",
        "en": "Product image",
      } +
      {
        "ar": "حمل الصورة",
        "en": "Upload image",
      } +
      {
        "ar": "وصف للمنتج",
        "en": "Product description",
      } +
      {
        "ar": "السعر",
        "en": "Price",
      } +
      {
        "ar": "الرجاء ملئ كافة الحقول قبل اضافة المنتج",
        "en": "Please fill all the fields first",
      } +
      {
        "ar": "تعديل ",
        "en": "Edit",
      } +
      {
        "ar": "العودة",
        "en": "Back",
      };

  String get i18n => localize(this, _t);
}
