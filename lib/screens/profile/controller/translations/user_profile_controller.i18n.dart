import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "كلمة المرور التي ادخلتها ليست صحيحة !",
        "en": "Password isn't Correct !",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": " try again Please ..",
      } +
      {
        "ar": "تم تغير كلمة المرور بنجاح ",
        "en": "Password has been changed successfully",
      };

  String get i18n => localize(this, _t);
}
