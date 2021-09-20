import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": 'هل أنت متأكد ؟',
        "en": "Are you sure ?",
      } +
      {
        "ar": 'انت على وشك حذف هذه الصورة !',
        "en": "You are about to delete this photo",
      } +
      {
        "ar": 'نعم',
        "en": "Yes",
      } +
      {
        "ar": 'لا',
        "en": "No",
      } +
      {
        "ar": "هذه الصورة بلفعل هي حالة لديك ",
        "en": "This photo is already in your status ",
      } +
      {
        "ar": 'انت على وشك اضافة هذه الصورة الى حالتك !',
        "en": "You are about to add this photo to your status",
      };

  String get i18n => localize(this, _t);
}
