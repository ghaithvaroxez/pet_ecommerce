
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":" الرجاء المحاولة مرة اخرى",
        "en":"Please try again ...",
      }
      + {
        "ar":    "حالتي",
        "en":  "My Status",
      }
      + {
        "ar": "الصور ",
        "en":  "Photos",
      }
      + {
        "ar": "الفيديوهات ",
        "en":  "Videos",
      }
      + {
        "ar": 'هل أنت متأكد ؟',
        "en":  "Are you sure ?",
      }
      + {
        "ar": 'انت على وشك حذف هذه الصوة !',
        "en":  "You are about to delete this photo !",
      }
      + {
        "ar": 'نعم',
        "en":  "Yes",
      } + {
        "ar": 'لا',
        "en":  "No",
      }





  ;

  String get i18n => localize(this, _t);
}
