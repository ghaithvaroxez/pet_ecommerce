import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import '../../../../main.dart';
import 'translations/search_bar.i18n.dart';

class OpenNow extends StatelessWidget {
  final bool rightBottom;
  bool state;

  OpenNow(this.state, {Key key, this.rightBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.brown.withOpacity(0.8),
          // Colors.white,
          Colors.brown,
        ]),
        borderRadius: rightBottom
            ? appLocal == "en"
                ? BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))
                : BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))
            : appLocal == "en"
                ? BorderRadius.only(topRight: Radius.circular(12))
                : BorderRadius.only(topLeft: Radius.circular(12)),
      ),
      child: Center(
        child: AutoSizeText(
          state == true ? "مفتوح الان".i18n : "مغلق الان".i18n,
          minFontSize: 11,
          style: blueButton_14pt,
        ),
      ),
    );
  }
}
