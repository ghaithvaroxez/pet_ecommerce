
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": " المعلومات الشخصية ",
        "en":  "Personal Information",
      }
      + {
        "ar": "المفضلة",
        "en":  "Favorite",
      }
      + {
        "ar": "الإشعارات",
        "en":  "Notifications",
      }
      + {
        "ar": "طلباتي",
        "en":  "My orders",
      }
      + {
        "ar": "زاويتي",
        "en":  "My corner",
      }
      + {
        "ar": "الإعدادت",
        "en":  "Settings",
      }

     + {
        "ar": "الأسئلة الشائعة",
        "en":  "FAQ",
      }

     + {
        "ar": "تسجيل الخروج",
        "en":  "Log out",
      }
  + {
        "ar": 'هل أنت متأكد ؟',
        "en":  "Are you sure ?",
      }
  + {
        "ar": 'انت على وشك تسجيل الخروج !',
        "en":  "You are about to log out !",
      }
  + {
        "ar": 'نعم',
        "en":  "Yes",
      }  + {
        "ar": 'لا',
        "en":  "No",
      }  + {
        "ar": 'نعم',
        "en":  "Yes",
      }





  ;

  String get i18n => localize(this, _t);
}
