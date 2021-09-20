import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "لقد تم اضافة طلبك بنجاح ",
        "en": "Your order has been successfully added ",
      } +
      {
        "ar": "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ",
        "en": "Please try again !",
      } +
      {
        "ar": "لقد تم حذف طلبك بنجاح ",
        "en": "Your order has been successfully deleted ",
      };

  String get i18n => localize(this, _t);
}
