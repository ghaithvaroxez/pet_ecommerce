import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": "اضافة منتج جديد",
        "en":  "Add new Product",
      }+ {
    "ar": "اضف منتج جديد",
    "en":  "Add your new product",
  }+ {
    "ar": "إعادة ضبط",
    "en":  "Reset",
  }+ {
    "ar":    "الصنف",
    "en": "Category" ,
  }+ {
    "ar": "النوع",
    "en":  "Type",
  }
+ {
    "ar": "اسم المنتج",
    "en":  "Product name",
  }
+ {
    "ar": "صورة المنتج",
    "en": "Product Image" ,
  }
+ {
    "ar": "حمل الصورة",
    "en":  "Upload Image",
  }
+ {
    "ar": "وصف للمنتج",
    "en":  "Product description",
  }+ {
    "ar":  "السعر",
    "en":  "Price",
  }+ {
    "ar": "الرجاء ملئ كافة الحقول قبل اضافة المنتج",
    "en":  "Please fill all the fields first",
  }+ {
    "ar": "الرجاء اضافة صورة للمنتج",
    "en": "Please add photo first" ,
  }+ {
    "ar": "إضافة ",
    "en":  "Add",
  }+ {
    "ar": "العودة",
    "en":  "Back",
  }



  ;

  String get i18n => localize(this, _t);
}