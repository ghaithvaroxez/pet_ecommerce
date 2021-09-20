import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "لقد تم حذف الرد بنجاح",
        "en": "Your answer has been successfully deleted",
      } +
      {
        "ar": "لم نتمكن من حذف ردك الان الرجاء المحاولة لاحقا",
        "en": "Please try again ..",
      } +
      {
        "ar": "الرجاء المحاولة مجدداً",
        "en": "Please try again...",
      } +
      {
        "ar": "لا يوجد ردود لك حتى الان",
        "en": "You don't have any answers yet",
      } +
      {
        "ar": 'هل أنت متأكد ؟',
        "en": "Are you sure?",
      } +
      {
        "ar": 'انت على وشك حذف هذا الرد !',
        "en": "You are about to delete this answer !",
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
