import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"الرجاء المحاولة مجدداً",
        "en": "Please try again",
      }

      + {
        "ar": "مواعيد العمل",
        "en":  "Work days",
      }
      + {
        "ar": "عذرا المتجر ليس له بريد الكتروني !",
        "en":  "Store don't have email !",
      }
      + {
        "ar": "احدث التقييمات",
        "en":  "Latest reviews",
      }
      + {
        "ar": "عرض ",
        "en":  "See",
      }
      + {
        "ar": "المزيد",
        "en":  "More",
      }
 + {
        "ar": "اقل",
        "en": "Less" ,
      }
 + {
        "ar": 'يجب عليك تسجيل حساب اولاً ',
        "en":  "You have to register first",
      }
 + {
        "ar": 'العودة',
        "en":  "back",
      }
 + {
        "ar": 'تسجيل حساب',
        "en": "Resister" ,
      }

 + {
        "ar":  'ماهو تقيمك لهذا المتجر  ؟',
        "en": "What is your assessment of this store?",
      }

 + {
        "ar": 'اخبرنا برئيك عن هذا المتجر',
        "en":   "Tell us what you think about this store",
      }

 + {
        "ar": 'متابعة',
        "en":  "Continue",
      }

 + {
        "ar":"عذرا حدثت مشكلة بجلب التقيمات الرجاء المحاولة مجدداً" ,
        "en":  "Sorry, there was a problem fetching reviews, please try again" ,
      }





  ;

  String get i18n => localize(this, _t);
}
