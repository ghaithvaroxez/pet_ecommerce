import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "الرجاء الانتظار ...",
        "en": "Loading..",
      } +
      {
        "ar": "مواعيد العمل",
        "en": "Work Days",
      } +
      {
        "ar": "اضافة",
        "en": "Add",
      } +
      {
        "ar": "اضف  مواعيد العمل لديك",
        "en": "Add your work days",
      } +
      {
        "ar": "معلومات التواصل",
        "en": "Social media contacts  ",
      } +
      {
        "ar": "رقم الهاتف الجوال",
        "en": "Phone number",
      } +
      {
        "ar": "الايميل  الالكتروني",
        "en": "Email",
      } +
      {
        "ar": "اضافة بريد الكتروني",
        "en": "ADd your email",
      } +
      {
        "ar": "تعديل البريد الكتروني",
        "en": "Edit your email",
      } +
      {
        "ar": " التواصل الاجتماعي",
        "en": "Social Media",
      } +
      {
        "ar": "أضافة",
        "en": "Add",
      } +
      {
        "ar": "حساب الفيسبوك",
        "en": "Facebook account",
      } +
      {
        "ar": "حساب الانستاغرام",
        "en": "Instagram account",
      } +
      {
        "ar": "رقم الواتس اب",
        "en": "Whatsapp Number",
      } +
      {
        "ar": "وصف للمتجر",
        "en": "Store description",
      } +
      {
        "ar": "اضف وصف للمتجر",
        "en": "Add Store description",
      } +
      {
        "ar": "اضافة وصف للمتجر",
        "en": "Add store description",
      } +
      {
        "ar": "تعديل وصف المتجر",
        "en": "Edit Store description",
      } +
      {
        "ar": "شعار المتجر",
        "en": "Store Logo",
      } +
      {
        "ar": "حمل صورة",
        "en": "Upload Photo",
      };

  String get i18n => localize(this, _t);
}
