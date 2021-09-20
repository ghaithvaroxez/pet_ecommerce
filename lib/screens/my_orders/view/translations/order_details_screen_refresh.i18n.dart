import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "لقد تم حذف الرد بنجاح",
        "en": "Your answer has been deleted successfully",
      } +
      {
        "ar": " الرجاء المحاولة لاحقا",
        "en": "Please try again",
      } +
      {
        "ar": "تفاصيل الطلب",
        "en": "Order Details",
      } +
      {
        "ar": 'ادخل ردك على هذا الطلب',
        "en": "Enter your answer",
      } +
      {
        "ar": 'العودة',
        "en": "Back",
      } +
      {
        "ar": 'نشر الرد',
        "en": "Publish your answer",
      } +
      {
        "ar": " حاول مجدداً",
        "en": "Please try again ..",
      } +
      {
        "ar": "انقر لإضافة ردك ",
        "en": "Tap to add Your Answer",
      } +
      {
        "ar": "لا يوجد عناصر لعرضها حالياً",
        "en": "No items available ...",
      } +
      {
        "ar": 'هل أنت متأكد ؟',
        "en": "Are you sure ?",
      } +
      {
        "ar": 'انت على وشك حذف هذا الرد !',
        "en": "You are about to delete this answer !",
      } +
      {
        "ar": "لا يوجد عناصر لعرضها حالياً",
        "en": "No items available ...",
      } +
      {
        "ar": 'نعم',
        "en": "Yes",
      } +
      {
        "ar": 'لا',
        "en": "No",
      };

  String get i18n => localize(this, _t);
}
