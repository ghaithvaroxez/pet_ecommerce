import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar":'هل أنت متأكد ؟' ,
        "en":  "Are you sure ?",
      }   + {
        "ar":'انت على وشك حذف هذه الصوة !',
        "en":  "You are about to delete this photo !",
      }   + {
        "ar":'نعم' ,
        "en":  "Yes",
      } + {
        "ar":'لا',
        "en":  "No",
      }
+ {
        "ar":"لا يوجد صور حالياً",
        "en":  "No photos availabel now ...",
      }

  ;

  String get i18n => localize(this, _t);
}
