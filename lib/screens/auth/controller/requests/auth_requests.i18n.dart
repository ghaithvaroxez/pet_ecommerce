import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "لقد قمت بادخال كود خاطئ الرجاء المحاولة لاحقا ",
        "en": "You entered wrong code, please try again later. ",
      } +
      {
        "ar": "فشلت العملية الرجاء المحاولة مجدداً",
        "en": "failed,please try again . ",
      } +
      {
        "ar": "لقد قمنا بارسال رسالة الى الرقم",
        "en": "we send a message to ",
      } +
      {
        "ar": "حدثت مشكلة اثناء التحقق من الرقم  الرجاء المحاولة لاحقا ",
        "en": "there is a problem while verify your phone try again please",
      };

  String get i18n => localize(this, _t);
}
