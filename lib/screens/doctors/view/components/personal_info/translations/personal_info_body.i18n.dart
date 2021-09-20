import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "مواعيد العمل",
        "en": "work times",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً !",
        "en": "try again please ",
      } +
      {
        "ar": "عذرا الطبيب ليس له بريد الكتروني !",
        "en": "Sorry, the doctor does not have an email! ",
      } +
      {
        "ar": "احدث التقييمات",
        "en": "Latest reviews ",
      } +
      {
        "ar": "عرض",
        "en": "See",
      } +
      {
        "ar": "المزيد",
        "en": "more",
      } +
      {
        "ar": "اقل",
        "en": "less",
      } +
      {
        "ar": 'العودة',
        "en": "back",
      } +
      {
        "ar": 'تسجيل حساب',
        "en": "Register",
      } +
      {
        "ar": 'يجب عليك تسجيل حساب اولاً ',
        "en": "You have to register first",
      } +
      {
        "ar": 'ماهو تقيمك لهذا الطبيب  ؟',
        "en": "What is your assessment of this doctor?",
      } +
      {
        "ar": 'اخبرنا برأيك عن هذا الطبيب',
        "en": "Tell us what you think about this doctor",
      } +
      {
        "ar": 'متابعة',
        "en": "continue",
      } +
      {
        "ar": "عذرا حدثت مشكلة بجلب التقيمات الرجاء المحاولة مجدداً",
        "en": "Sorry, there was a problem fetching reviews, please try again",
      };

  String get i18n => localize(this, _t);
}
