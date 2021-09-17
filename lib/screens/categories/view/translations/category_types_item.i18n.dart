import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"المنتجات",
        "en":  "Products",
      }
      + {
  "ar": "الرجاء المحاولة مرة اخرى ",
  "en": "Please try again ..." ,
}






  ;

  String get i18n => localize(this, _t);
}
