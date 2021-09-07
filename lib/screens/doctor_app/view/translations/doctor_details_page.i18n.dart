import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"الخدمات ",
        "en": "Services",
      }  + {
        "ar":"معلومات شخصية",
        "en": "Personal Info",
      }





  ;

  String get i18n => localize(this, _t);
}
