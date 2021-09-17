import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")


      + {
        "ar": "فيسبوك",
        "en":  "Facebook",
      }+ {
    "ar": "انستغرام",
    "en": "Instagram" ,
  }+ {
    "ar": "رقم هاتف",
    "en":  "Phone number",
  }+ {
    "ar": "اضافة معلومات التواصل الاجتماعي",
    "en":  "Add contact informations",
  }+ {
    "ar": "النوع",
    "en":  "Type",
  }
  + {
        "ar": "الرابط",
        "en": "Link" ,
      }+ {
    "ar": "لم تقم بادخال رابط",
    "en":  "you don't enter any link",
  }+ {
    "ar":  "حفظ ومتابعة ",
    "en":  "Save & Continue",
  }+ {
    "ar": " الرجاء المحاولة مرة اخرى ",
    "en":  "Please try again ",
  }+ {
    "ar": "اضافة مواعيد العمل",
    "en":  "Add work times",
  }+ {
    "ar": "تعديل مواعيد العمل",
    "en":  "Edit work times",
  }
  + {
        "ar": "يفتح عند الساعة ",
        "en":  "Open At",
      }+ {
    "ar": "يغلق عند الساعة ",
    "en": "Close At" ,
  }+ {
    "ar":"الرجاء ملئ الحقول",
    "en":  "please fill the fields",
  }+ {
    "ar": "البريد الالكتروني",
    "en":  "Email",
  }+ {
    "ar": "لم تقم بادخال اي بريد الكتروني ",
    "en":   "you don't enter any email",
  }
  + {
        "ar": "الوصف",
        "en":  "Description",
      }+ {
    "ar": "تعديل معلومات التواصل الاجتماعي",
    "en":  "Edit social media information",
  }+ {
    "ar": "حذف ",
    "en": "Delete" ,
  }+ {
    "ar": "تعديل",
    "en":  "Edit",
  };

  String get i18n => localize(this, _t);
}
