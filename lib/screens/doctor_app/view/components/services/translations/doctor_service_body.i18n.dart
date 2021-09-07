import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"لايوجد خدمات حالياً",
        "en": "There is no services now ...",
      }





  ;

  String get i18n => localize(this, _t);
}
