import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": "المنتجات",
        "en":  "Products",
      }+ {
    "ar": "عن المتجر",
    "en":  "About store",
  }+ {
    "ar":  "العروض",
    "en":  "Offers",
  }+ {
    "ar": "الصور",
    "en":  "Photos",
  }



  ;

  String get i18n => localize(this, _t);
}