import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": "اضافة عرض جديد",
        "en":  "Add new offer",
      }+ {
    "ar": "اضف عرض جديد",
    "en":  "Add your new offer",
  }+ {
    "ar": "إعادة ضبط",
    "en":  "Reset",
  }+ {
    "ar": "الصنف",
    "en":  "Category",
  }+ {
    "ar": "النوع",
    "en":  "Type",
  }



      + {
        "ar":  "اسم العرض",
        "en":  "Offer name",
      }+ {
    "ar": "صورة العرض",
    "en":  "Offer photo",
  }+ {
    "ar": "حمل الصورة",
    "en":  "Add Photo",
  }+ {
    "ar": "وصف للعرض",
    "en":  "Offer description",
  }+ {
    "ar": "الرجاء ملئ كافة الحقول قبل اضافة العرض",
    "en":  "Please fill all the fields first",
  }
+ {
    "ar": "الرجاء اضافة صورة للعرض",
    "en":  "Please add photo first",
  }
+ {
    "ar": "إضافة " ,
    "en":  "Add",
  }
+ {
    "ar": "العودة",
    "en":  "Back",
  }




  ;

  String get i18n => localize(this, _t);
}
