import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "اضافة خدمة جديد",
        "en": "Add new Service",
      } +
      {
        "ar": "اضف خدمة جديد",
        "en": "Add new Service",
      } +
      {
        "ar": "إعادة ضبط",
        "en": "Reset",
      } +
      {
        "ar": "الصنف",
        "en": "Category",
      } +
      {
        "ar": "السعر",
        "en": "Price",
      } +
      {
        "ar": "اسم الخدمة",
        "en": "Service Name",
      } +
      {
        "ar": "وصف للخدمة",
        "en": "Service description",
      } +
      {
        "ar": "صورة الخدمة",
        "en": "Service Photo",
      } +
      {
        "ar": "حمل الصورة",
        "en": "upload photo",
      } +
      {
        "ar": "الرجاء ملئ كافة الحقول قبل اضافة الخدمة",
        "en": "Please fill all the fields ..",
      } +
      {
        "ar": "الرجاء اضافة صورة الخدمة",
        "en": "Please add photo to the service ..",
      } +
      {
        "ar": "إضافة ",
        "en": "Add",
      } +
      {
        "ar": "العودة",
        "en": "Back",
      };

  String get i18n => localize(this, _t);
}
