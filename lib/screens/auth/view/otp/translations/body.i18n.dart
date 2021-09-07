import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar") +

     {
        "ar": "التحقق من رقم الهاتف",
        "en":  "Verify your phone",
      }
      + {
        "ar": "لقد تم ارسال رمز التحق الى الرقم ",
        "en":  "We sent verification code to ",
      }

      + {
        "ar": "اعادة ارسال الرمز",
        "en":  "Resend the code",
      }

      + {
        "ar": "سوف تنتهي صلاحية الكود بعد ",
        "en":  "Code will expire after",
      }

  ;

  String get i18n => localize(this, _t);
}
