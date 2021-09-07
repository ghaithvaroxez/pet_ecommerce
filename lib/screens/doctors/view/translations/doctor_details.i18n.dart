import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"مفتوح الان",
        "en": "Now open",
      }
  + {
        "ar":"الخدمات ",
        "en": "Services",
      }
 + {
        "ar":  "معلومات شخصية ",
        "en": "Personal info",
      }





  ;

  String get i18n => localize(this, _t);
}
