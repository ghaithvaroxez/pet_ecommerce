import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "معلومات مهنية",
        "en": "Career information",
      } +
      {
        "ar": "اضف معلومات مهنية",
        "en": "add your career information",
      } +
      {
        "ar": "اضافة معلومات مهنية",
        "en": "add your career information",
      } +
      {
        "ar": "تعديل المعلومات مهنية",
        "en": "edit your career information",
      } +
      {
        "ar": "مواعيد العمل",
        "en": "Work days",
      } +
      {
        "ar": "اضافة",
        "en": "Add",
      } +
      {
        "ar": "اضف  مواعيد العمل لديك",
        "en": "Add your work times",
      } +
      {
        "ar": "معلومات التواصل",
        "en": "Contact information",
      } +
      {
        "ar": "رقم الهاتف الجوال",
        "en": "Mobile number",
      } +
      {
        "ar": "الايميل  الالكتروني",
        "en": "Email",
      } +
      {
        "ar": "اضافة بريد الكتروني",
        "en": "Add your email",
      } +
      {
        "ar": "تعديل البريد الكتروني",
        "en": "Edit email",
      } +
      {
        "ar": " التواصل الاجتماعي",
        "en": "Social media",
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
        "ar": "رقم الهاتف",
        "en": "Phone number",
      } +
      {
        "ar": "شعار الطبيب",
        "en": "Doctor photo",
      } +
      {
        "ar": "حمل صورة",
        "en": "Upload photo",
      } +
      {
        "ar": "أضافة",
        "en": "Add",
      };

  String get i18n => localize(this, _t);
}
