import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "إضافة طلب",
        "en":  "Add order",
      }
      + {
        "ar": "إضافة طلب جديد",
        "en":  "Add new order",
      }
      + {
        "ar": "إعادة ضبط",
        "en":  "Reset",
      }
      + {
        "ar": "الصنف",
        "en":  "Category",
      }
      + {
        "ar": "النوع",
        "en": "Type" ,
      }
      + {
        "ar": "نوع الطلب",
        "en":  "Order Type",
      }
      + {
        "ar": "حيوان",
        "en":  "Animal",
      }
      + {
        "ar": "بيطري",
        "en":  "Doctor review",
      }
    + {
        "ar": "عنوان الطلب",
        "en":  "Order Title",
      }
    + {
        "ar": "صورة الطلب",
        "en":  "Order Photo",
      }
   + {
        "ar": "حمل الصورة",
        "en":  "Upload Photo",
      }
  + {
        "ar": "مواصفات خاصة بالطلب",
        "en":  "Order description",
      } + {
        "ar":  "السعر المتوقع",
        "en":  "Expected Price",
      } + {
        "ar": "مواصفات خاصة بالطلب",
        "en":  "Order description",
      }

+ {
        "ar": "الرجاء ملئ كافة الحقول قبل اضافة الطلب",
        "en":  "Please fill all the fields first ",
      }+ {
        "ar": "الرجاء اضافة صورة للطلب",
        "en":  "Please add photo first ",
      }
+ {
        "ar": "إرسال الطلب ",
        "en":  "Send order ",
      }
+ {
        "ar": "العودة",
        "en":  "Back",
      }





  ;

  String get i18n => localize(this, _t);
}
