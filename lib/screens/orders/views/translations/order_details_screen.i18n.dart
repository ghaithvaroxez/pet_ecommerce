import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"لقد تم حذف الرد بنجاح",
        "en": "Your answer was deleted successfully ",
      }
      + {
        "ar": "لم نتمكن من حذف ردك الان الرجاء المحاولة لاحقا",
        "en":  "Try again please ...",
      } + {
    "ar": "الرجاء المحاولة مجدداً",
    "en":  "Try again please ...",
  } + {
    "ar":"تفاصيل الطلب",
    "en":  "Order details",
  } + {
    "ar": "حيوانات",
    "en":  "Animals",
  } + {
    "ar": "استطباب",
    "en":  "Doctor review",
  } + {
    "ar": "الردود",
    "en":  "Answers",
  } + {
    "ar": 'ادخل ردك على هذا الطلب',
    "en":  "Enter your answer",
  } + {
    "ar": 'العودة',
    "en":  "back",
  } + {
    "ar": 'نشر الرد',
    "en":  "Publish",
  }
      + {
        "ar":  "الرد لا يمكن ان يكون فارغاً",
        "en":  "fill the field first ...",
      }
      + {
        "ar":"انقر لإضافة ردك " ,
        "en":  "Tap to add your answer",
      } + {
        "ar":"لا يوجد عناصر لعرضها حالياً" ,
        "en":  "No items available now ...",
      } + {
        "ar":'هل أنت متأكد ؟',
        "en":  "Are you sure ?",
      }
 + {
        "ar": 'انت على وشك حذف هذا الرد !',
        "en":  "You are about to delete this answer !",
      }+ {
        "ar": 'نعم',
        "en": "Yes",
      }
+ {
        "ar": 'لا',
        "en": "No",
      }




  ;

  String get i18n => localize(this, _t);
}
