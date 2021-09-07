import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"زاويتي",
        "en": "My corner",
      }
  + {
        "ar":"لا يوجد عناصر حاليا",
        "en": "No items available now",
      }





  ;

  String get i18n => localize(this, _t);
}
