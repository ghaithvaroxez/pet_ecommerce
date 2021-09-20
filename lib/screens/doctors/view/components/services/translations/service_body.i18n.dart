import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("ar") +
      {
        "ar": "لا يوجد عناصر حاليا",
        "en": "No items available ...",
      };

  String get i18n => localize(this, _t);
}
