import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "تسجيل الدخول",
        "en": "Sign in",
      } +
      {
        "ar": "أضف رقم هاتفك الجوال وكلمة المرور لتسجيل الدخول",
        "en": "Add your phone number and password to Sign in",
      } +
      {
        "ar": "رقم الهاتف الجوال",
        "en": "Phone number",
      } +
      {
        "ar": "كلمة السر",
        "en": "password",
      } +
      {
        "ar": "الرجاء ادخال رقم هاتف لتسجيل الدخول ",
        "en": "Please insert your phone number to login",
      } +
      {
        "ar": "الرجاء ادخال كلمة مرور لتسجيل الدخول ",
        "en": "please insert a password first",
      } +
      {
        "ar": " رقم الهاتف الذي ادخلته غير صالح",
        "en": "Phone number isn't valid",
      } +
      {
        "ar": "كلمة المرور قصيرة جدا",
        "en": "password is too short",
      } +
      {
        "ar": " رقم الهاتف  أو كلمة المرور غير صحيحة",
        "en": "Incorrect phone number or password ",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": "Please try again ",
      };

  String get i18n => localize(this, _t);
}
