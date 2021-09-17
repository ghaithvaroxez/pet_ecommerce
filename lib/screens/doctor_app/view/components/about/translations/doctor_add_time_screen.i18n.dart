import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"الرجاء المحاولة مجدداً",
        "en": "Please try again...",
      }
+ {
        "ar":"اضافة مواعيد العمل",
        "en": "Add work times",
      }
+ {
        "ar":"يفتح عند الساعة ",
        "en": "Open from",
      }
+ {
        "ar":"يغلق عند الساعة ",
        "en": "Close at",
      }+ {
        "ar":"الرجاء ملىء الحقول",
        "en": "please fill the fields",
      }+ {
        "ar":"حفظ ومتابعة ",
        "en": "Save & Continue",
      }





  ;

  String get i18n => localize(this, _t);
}