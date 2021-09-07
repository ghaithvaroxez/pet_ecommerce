import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "تعديل الطلب ",
        "en":  "Edit order",
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
    "ar":  "السعر",
    "en":  "Price",
  } + {
    "ar": "مواصفات خاصة بالطلب",
    "en":  "Order description",
  }

      + {
        "ar":  "الرجاء ملئ كافة الحقول قبل اضافة الطلب",
        "en":  "Please fill all the fields first ",
      }+ {
    "ar": "لقد تم تعديل طلبك بنجاح",
    "en":  "Your request has been successfully modified" ,
  }
      + {
        "ar": "إرسال الطلب ",
        "en":  "Send order ",
      }
      + {
        "ar": " الرجاء المحاولة مجدداً",
        "en":  "Try again Please",
      }
   + {
        "ar": "تعديل الطلب",
        "en":  "Edit order",
      }
   + {
        "ar": "العودة",
        "en":  "Back",
      }





  ;

  String get i18n => localize(this, _t);
}
