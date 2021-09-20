import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "ar": "لايمكن اضافة الصورة لحالتك الان الرجاء المحاولة مجدداً",
        "en": "can't add your photo now try again later",
      } +
      {
        "ar": "حجم الفيديو كبير جدا الرجاء اختيار فيديو اخر",
        "en": "Video size is too big .Please select another one...",
      } +
      {
        "ar": "لايمكن اضافة الفيديو لحالتك الان الرجاء المحاولة مجدداً",
        "en": "can't add your video now try again later",
      } +
      {
        "ar": "لم نتمكن من حذف حالتك الان ز الرجاء المحاولة مجدداً",
        "en": "can't delete your status now try again later",
      };

  String get i18n => localize(this, _t);
}
