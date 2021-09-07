import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "طلباتي ",
        "en":  "My orders",
      } + {
    "ar": "ردودي",
    "en":  "My answers",
  }

  ;

  String get i18n => localize(this, _t);
}
