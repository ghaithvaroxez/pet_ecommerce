import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "طبيب",
        "en": "Doctor",
      }
      + {
        "ar": "مستخدم",
        "en": "User",
      }
      + {
        "ar": "متجر",
        "en": "Store",
      }
      + {
        "ar": "اسطبل",
        "en": "Stable",
      }
      + {
        "ar": "منحلة",
        "en": "Sieve",
      }
      + {
        "ar": "طلب انضمام",
        "en": "Join request ",
      }
      + {
        "ar": "النوع",
        "en": "Type",
      }
      + {
        "ar": "اسم الاسطبل",
        "en": "Stable name",
      }
      + {
        "ar": "اسم المتجر",
        "en": "Store name",
      }
      + {
        "ar": "اسم المنحلة",
        "en": "Sieve name",
      }
      + {
        "ar": "الاسم الأخير",
        "en": "Last name",
      }
      + {
        "ar": "الاسم الاول",
        "en": "First name",
      }
      + {
        "ar": "رقم الهاتف",
        "en": "Phone number",
      }
      + {
        "ar": "رقم الهاتف الجوال",
        "en": "MobileNumber",
      }
      + {
        "ar": "كلمة السر",
        "en": "Password",
      }
      + {
        "ar": "العنوان",
        "en": "Address",
      }
      + {
        "ar": "متابعة",
        "en": "Continue",
      }
      + {
        "ar": " رقم الهاتف الذي ادخلته غير صالح",
        "en": "Phone number is not valid",
      }
      + {
        "ar": "الرجاء ادخال كلمة مرور لإكمال طلبك ",
        "en": "Please enter password to register",
      }
      + {
        "ar": "كلمة المرور قصيرة جدا",
        "en": "Password is too short",
      }
      + {
        "ar": " رقم الهاتف  موجود مسبقا بالفعل",
        "en": "Phone number already exist",
      }
      + {
        "ar": "الرجاء تعبئة كافة الحقول اولاً",
        "en": "Please fill the fields first",
      }
      + {
        "ar": "حدث خطأ ما اثناء التسجيل الرجاء المحاولة  مرة اخرى",
        "en": "An error occurred during registration, please try again",
      }


  ;

  String get i18n => localize(this, _t);
}
