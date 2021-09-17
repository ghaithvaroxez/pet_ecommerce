import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": "لايوجد عروض حالياً",
        "en": "No offers available now ..." ,
      }


  ;

  String get i18n => localize(this, _t);
}
