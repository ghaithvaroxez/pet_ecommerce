import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar":  'هل أنت متأكد ؟',
        "en":  "Are you sure ?",
      }+ {
    "ar":'انت على وشك حذف هذا المنتج !' ,
    "en": "You are about to delete this product !" ,
  }+ {
    "ar": 'نعم',
    "en":  "Yes",
  }+ {
    "ar": 'لا',
    "en":  "No",
  }



  ;

  String get i18n => localize(this, _t);
}