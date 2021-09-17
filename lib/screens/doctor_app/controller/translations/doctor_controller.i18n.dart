
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")
      + {
        "ar": "عذراً لم نتمكن من تحديث معلومات الطبيب الرجاء المحاولة مجدداً",
        "en": "error can't update doctor data now try again later !!" ,
      }  +
      {
        "ar": "عذراً لم نتمكن من اضافة موقعك الرجاء المحاولة مجدداً",
        "en": " can't set your location now try again later !!" ,
      }
     + {
        "ar": "عذراً لم نتمكن من تحديث أوقات دوام الطبيب الرجاء المحاولة مجدداً",
        "en": "can't update doctor work times now try again later !!" ,
      } + {
        "ar": "عذراً لم نتمكن من اضافة أوقات دوام الطبيب الرجاء المحاولة مجدداً",
        "en": "can't add doctor work times now try again later !!" ,
      } + {
        "ar": "عذراً لم نتمكن من حذف أوقات دوام الطبيب الرجاء المحاولة مجدداً",
        "en": "can't delete doctor work times now try again later !!" ,
      }
     + {
        "ar": "لم نتمكن من تعديل خدمتك الرجاء المحاولة مجدداً",
        "en": "can't edit your service now try again later" ,
      }

      + {
        "ar":  "لم نتمكن من حذف خدمتك الرجاء المحاولة مجدداً",
        "en": "can't delete your service now try again later" ,
      }

      + {
        "ar":  "لم نتمكن من اضافة خدمتك الرجاء المحاولة مجدداً",
        "en":  "can't add your service now try again later",
      }
  ;

  String get i18n => localize(this, _t);
}

