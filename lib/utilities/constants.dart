import 'package:flutter/material.dart';

class Renkler {
  static const Color primary = Color(0xfffdfffc);
  static const Color pDark = Color(0xffe3e5e2);
  static const Color secondary = Color(0xff559cae);
  static const Color third = Color(0xffdf525a);
  static const Color fourth = Color(0xffff9f1c);
  static const Color red = Color(0xffd00000);
  static const Color yellow = Color(0xffffba08);
  static const Color blue = Color(0xff6891c5);
  static const Color green = Color(0xff007f5f);
  static const Color greenDark = Color(0xff4ba58c);
  static const Color dark = Color(0xff000000);
  static const Color dDark = Color(0xff335c67);
  static const Color dDarkBlue = Color(0xff253141);
}

Map<int, String> myQuestions = {
  0: "İnsanlarla temasta bulundum",
  1: "Virüs havuzu dışından birisiyle temasta bulundum",
  2: "Ortamda maske ve mesafe kurallarına uyuluyordu",
  3: "Açık havada yaşandı",
  4: "15 dakikadan uzundu",
  5: "Grip belirtisi gösteren birisi/birileri vardı",
};

final buttonTextStyle = TextStyle(
    color: Renkler.primary, fontWeight: FontWeight.bold, fontSize: 20);
final infoTextStyle =
    TextStyle(color: Renkler.dark, fontWeight: FontWeight.bold, fontSize: 15);
