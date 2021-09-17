import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"تعديل خدمة ",
        "en": "Edit Service",
      }
 + {
        "ar":        "تعديل الخدمة ",
        "en": "Edit the Service",
      }

      + {
        "ar":"إعادة ضبط",
        "en": "Rest",
      }

      + {
        "ar":"الصنف",
        "en": "Category",
      }

      + {
        "ar":"السعر",
        "en": "Price",
      }

      + {
        "ar":"اسم الخدمة",
        "en": "Service Name",
      } + {
    "ar":"وصف الخدمة",
    "en": "Service description",
  }
      + {
        "ar":"صورة الخدمة",
        "en": "Service Photo",
      }+ {
        "ar":"صورة توضيحية",
        "en": "explanatory  Photo",
      }
      + {
        "ar":"حمل الصورة",
        "en": "upload photo",
      }
      + {
        "ar":"الرجاء ملئ كافة الحقول قبل تعديل الخدمة",
        "en": "Please fill all the fields ..",
      }
      + {
        "ar":"الرجاء اضافة صورة الخدمة",
        "en": "Please add photo to the service ..",
      }

      + {
        "ar":"تعديل ",
        "en": "edit",
      }
      + {
        "ar":"العودة",
        "en": "Back",
      }





  ;

  String get i18n => localize(this, _t);
}
