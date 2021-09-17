import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"المعلومات المهنية",
        "en": "Career  Information",
      }
    + {
        "ar":"ادخل الوصف اولاً",
        "en": "Please enter description first",
      } + {
        "ar": "حفظ ومتابعة ",
        "en": "Save & Continue",
      }





  ;

  String get i18n => localize(this, _t);
}