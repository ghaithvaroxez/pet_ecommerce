import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "تعديل العرض ",
        "en": "Edit offer",
      } +
      {
        "ar": "تعديل العرض ",
        "en": "Edit your offer",
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
        "ar": "اسم العرض",
        "en": "Offer name",
      } +
      {
        "ar": "صورة العرض",
        "en": "Offer Photo",
      } +
      {
        "ar": "حمل الصورة",
        "en": "Upload photo",
      } +
      {
        "ar": "وصف للعرض",
        "en": "Offer description",
      } +
      {
        "ar": "الرجاء ملئ كافة الحقول قبل اضافة العرض",
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
