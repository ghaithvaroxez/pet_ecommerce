import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": 'هل أنت متأكد ؟',
        "en":  "Are you sure ?",
      }+ {
    "ar": 'انت على وشك الخروج من التطبيق !',
    "en":  "you are going to close the application",
  }+ {
    "ar": 'نعم',
    "en":  "Yes",
  }+ {
    "ar": 'لا',
    "en": "No" ,
  }
+ {
    "ar": "الرجاء التاكد من توفر الانترنت",
    "en": "Please check your connections" ,
  }
+ {
    "ar": "لقد تم التوصيل بلانترنت",
    "en": "you are connected " ,
  }



  ;

  String get i18n => localize(this, _t);
}