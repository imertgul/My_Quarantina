import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Renkler.secondary),
          child: Center(
            child: Text(
              "Uyarılar ve sıfırlama ekranı",
              style: buttonTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
