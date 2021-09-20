import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "البريد الالكتروني",
        "en": "Email",
      } +
      {
        "ar": "الرجاء ادخال بريد الكتروني",
        "en": "Please enter email",
      } +
      {
        "ar": "حفظ ومتابعة ",
        "en": "Save & Continue",
      };

  String get i18n => localize(this, _t);
}
