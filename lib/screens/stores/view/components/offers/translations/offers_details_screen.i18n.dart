import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"اسم المتجر",
        "en": "Store name",
      }
      + {
        "ar":"الوصف" ,
        "en":  "Description",
      }






  ;

  String get i18n => localize(this, _t);
}
