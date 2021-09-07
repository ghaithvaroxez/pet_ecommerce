
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"مفتوح الان",
        "en": "Now open",
      }

      + {
        "ar": "الصور",
        "en":  "Photos",
      }

      + {
        "ar": "المنتجات",
        "en":  "Products",
      }

      + {
        "ar": "عن المتجر",
        "en":  "About Store",
      }

      + {
        "ar": "العروض",
        "en":  "Offers",
      }



  ;

  String get i18n => localize(this, _t);
}

