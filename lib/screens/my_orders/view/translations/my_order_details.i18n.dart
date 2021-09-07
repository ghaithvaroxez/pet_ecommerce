import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "تفاصيل الطلب",
        "en":  "Order Details",
      } + {
    "ar": "حيوانات",
    "en":  "Animal",
  }
      + {
        "ar": "استطباب",
        "en":  "Doctor review",
      } + {
    "ar": "الردود",
    "en":  "Answers",
  }
      + {
        "ar": "لا يوجد عناصر لعرضها حالياً",
        "en": "No items available ..." ,
      }



  ;

  String get i18n => localize(this, _t);
}
