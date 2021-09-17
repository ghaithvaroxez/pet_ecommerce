import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "الرجاء المحاولة مجدداً",
        "en":  "Please try again",
      }+ {
    "ar": "الأصناف",
    "en":  "Categories",
  }+ {
    "ar": "عرض المزيد",
    "en":  "See more",
  }+ {
    "ar": "لا يوجد أصناف لعرضها حالياً",
    "en":  "No categories Available now ",
  }+ {
    "ar": "السلع",
    "en":  "Products",
  }+ {
    "ar": "لا يوجد منتجات لعرضها حالياً",
    "en":  "No products available now",
  }+ {
    "ar": "لا يوجد حالات لعرضها حالياً",
    "en":  "No stories available now",
  }+ {
    "ar": "المتاجر",
    "en":  "Stores",
  }+ {
    "ar": "لا يوجد متاجر لعرضها حالياً",
    "en":  "No stores Available now",
  }+ {
    "ar": "الأطباء البيطريين",
    "en": "Doctors" ,
  }+ {
    "ar": "لا يوجد أطباء لعرضها حالياً",
    "en":  "No doctors available now",
  }+ {
    "ar": "العروض",
    "en":  "Offers",
  }+ {
    "ar": "لا يوجد عروض حالياً",
    "en": "No offers available now" ,
  }+ {
    "ar": "الاسطبلات",
    "en":  "Stables",
  }+ {
    "ar": "لا يوجد أسطبلات لعرضها حالياً",
    "en":  "No stables available now",
  }+ {
    "ar": "المناحل",
    "en":  "Sieves",
  }+ {
    "ar": "لا يوجد مناحل لعرضها حالياً",
    "en":   "No sieves available now",
  }




  ;

  String get i18n => localize(this, _t);
}


