import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "الرئيسية",
        "en": "Home" ,
      } + {
    "ar": "الاطباء",
    "en":  "Doctors",
  } + {
    "ar": "الطلبات",
    "en":  "Orders",
  } + {
    "ar": "المتاجر",
    "en":  "Stores",
  } + {
    "ar": "الزوايا",
    "en":  "Corners",
  }





  ;

  String get i18n => localize(this, _t);
}