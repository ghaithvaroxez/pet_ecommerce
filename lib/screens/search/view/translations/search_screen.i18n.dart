import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar": "عام",
        "en":  "General",
      }
      + {
        "ar": "منتجات",
        "en":  "Products",
      }
      + {
        "ar": "عروض",
        "en":"Offers",
      }
      + {
        "ar":  "متاجر",
        "en":  "Stores",
      }
      + {
        "ar": "اسطبلات",
        "en":  "Stables",
      }
      + {
        "ar": "مناحل",
        "en":  "Sieves",
      }
      + {
        "ar":  "اطباء",
        "en":  "Doctors",
      }
      + {
        "ar": "أصناف",
        "en":  "Categories",
      }
      + {
        "ar": "عدم تحديد",
        "en":  "All",
      }
      + {
        "ar": "النوع",
        "en":  "Type",
      }
      + {
        "ar": "المدينة",
        "en":  "City",
      }
      + {
        "ar": "الصنف",
        "en":  "Category",
      }
      + {
        "ar": "السعر",
        "en":  "Price",
      }
      + {
        "ar": "إظهار النتائج ",
        "en":  "Show Results",
      }
      + {
        "ar": "العودة",
        "en":  "Back",
      }
      + {
        "ar": "البحث",
        "en":  "Search",
      }
      + {
        "ar": "ابحث هنا",
        "en":  "Search here",
      }
      + {
        "ar":  "الرجاء المحاولة مجدداً",
        "en":  "Please try again !",
      }
      + {
        "ar": "المنتجات",
        "en":  "Products",
      }
      + {
        "ar": "لا يوجد عناصر لعرضها ",
        "en":  "No items ...",
      }
      + {
        "ar": "العروض",
        "en":  "Offers",
      }
      + {
        "ar": "المتاجر",
        "en":  "Stores",
      }
      + {
        "ar": "الاسطبلات",
        "en":  "Barns",
      }
      + {
        "ar": "المناحل",
        "en":  "Sieves",
      }
      + {
        "ar": "الاطباء",
        "en": "Doctors" ,
      }
      + {
        "ar": "الأصناف",
        "en":  "Categories",
      }
      + {
        "ar": "لا يوجد عناصر مطابقة لعرضها ",
        "en":  "No matches items",
      }







  ;

  String get i18n => localize(this, _t);
}
