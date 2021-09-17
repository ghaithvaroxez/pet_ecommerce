import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar":"تم ارسال طلبك بنجاح سوف تتمكن من الدخول عند الموافقة عليه ",
        "en":  "Your request has been sent successfully. You will be able to log in when it is approved." ,
      } + {
        "ar": "لقد تم حظرك من استخدام هذا التطبيق  ",
        "en":  "You have been banned from using this app" ,
      }
  ;

  String get i18n => localize(this, _t);
}
