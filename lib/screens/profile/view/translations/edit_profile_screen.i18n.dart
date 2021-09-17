
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": 'ادخل كلمة السر الجديدة ',
        "en":  "Enter new password ",
      }
      + {
        "ar": 'العودة',
        "en":  "back",
      }
      + {
        "ar": 'المتابعة',
        "en":  "Continue",
      }
      + {
        "ar": "كلمة المرور لا يمكن ان تكون فارغة",
        "en": "Password can't be empty" ,
      }
      + {
        "ar": "كلمة المرور لا يمكن ان تكون اقل من 6 محارف",
        "en":  "Password can't be less than 6 characters",
      }
      + {
        "ar": "حمل صورة",
        "en":  "Upload Photo",
      }  + {
        "ar": " المعلومات الشخصية ",
        "en":  "Personal Info",
      }  + {
        "ar": "الاسم الأخير",
        "en":  "Last Name",
      }  + {
        "ar": "الاسم الاول",
        "en":  "First Name",
      }  + {
        "ar": "عنوان السكن",
        "en":  "Address",
      }
+ {
        "ar":"البريد الالكتروني",
        "en":  "Email",
      }
+ {
        "ar": 'ادخل كلمة السر القديمة ',
        "en":  "Enter old password",
      }+ {
        "ar": "هل تريد تغير كلمة المرور ؟",
        "en":  "Change Password ?",
      }+ {
        "ar": "الرجاء ملئ كافة الحقول قبل تعديل البيانات",
        "en":  "Please fill all the fields first ",
      }+ {
        "ar": "تعديل ",
        "en":  "Edit",
      }+ {
        "ar": "العودة",
        "en":  "Back",
      }






  ;

  String get i18n => localize(this, _t);
}
