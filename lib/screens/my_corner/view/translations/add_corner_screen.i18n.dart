import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("ar")

      + {
        "ar":"زاويتي",
        "en": "My corner",
      }  + {
        "ar": "الصورة الرئيسية",
        "en": "Main Photo",
      }  + {
        "ar":"وصف الزاوية",
        "en": "Corner description",
      }  + {
        "ar":"اكتب عنوان الزاوية هنا",
        "en": "Write corner title here",
      }  + {
        "ar":"اكتب وصف الزاوية هنا",
        "en":  "Write corner description here",
      }  + {
        "ar": "صور إضافية ",
        "en": "Extra photos",
      }
+ {
        "ar": "حمل صورة",
        "en": "Upload photo",
      }
+ {
        "ar":"الرجاء ملئ كافة الحقول قبل اضافة الزاوية",
        "en": "Please fill all the fields first ...",
      }+ {
        "ar": "الرجاء اضافة صورة رئيسية للزاوية",
        "en": "Please add main photo to your corner",
      }+ {
        "ar": "اضافة ",
        "en": "Add",
      }+ {
        "ar": "العودة",
        "en": "Back",
      }





  ;

  String get i18n => localize(this, _t);
}
