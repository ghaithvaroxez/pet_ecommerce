import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": "حسابي",
        "en":  "My account",
      }+ {
    "ar": "أصناف",
    "en":  "Category",
  }+ {
    "ar": "المفضلة",
    "en":  "Favorite",
  }+ {
    "ar": "تسجيل حساب",
    "en":  "Register",
  }+ {
    "ar": "تسديد الاشتراك",
    "en":  "Payment",
  }
+ {
    "ar": "باقتي",
    "en":  "My package",
  }
+ {
    "ar": "حالتي",
    "en":  "My status",
  }
+ {
    "ar":"زاويتي",
    "en":  "My corner",
  }
+ {
    "ar": "طلباتي",
    "en":  "My orders",
  }
+ {
    "ar": "الإعدادت",
    "en":  "Setting",
  }
+ {
    "ar": "تسجيل الخروج",
    "en":  "Log out",
  }
+ {
    "ar": "الخريطة",
    "en":  "Map",
  }
+ {
    "ar": 'هل أنت متأكد ؟',
    "en":  "Are you sure ?",
  }
+ {
    "ar": 'انت على وشك تسجيل الخروج !',
    "en":  "You are going to log out",
  }
+ {
    "ar": 'نعم',
    "en":  "Yes",
  }
+ {
    "ar":'لا',
    "en":  "No",
  }+ {
    "ar":"الرجاء المحاولة مجدداً",
    "en":  "please try again",
  }
  ;

  String get i18n => localize(this, _t);
}
