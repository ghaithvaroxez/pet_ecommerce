import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":'يجب عليك تسجيل حساب اولاً ',
        "en": "You have to register first",
      }   + {

    "ar":'تسجيل حساب',
    "en": "Register",
  }  + {
    "ar":'العودة',
    "en": "Back",
  }
+ {
    "ar":"الرجاء المحاولة مجدداً",
    "en": "Please try again",
  }





  ;

  String get i18n => localize(this, _t);
}
