import 'package:flutter/material.dart';
import 'dart:async';
import '../utilities/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenHeight = 0;
  double statusBarHeight = 0;
  double unit = 0;
  bool _isSelected = true;
  double _animatedWidth = 50;
  double _animatedHeight = 50;
  Color _animatedColor = Renkler.secondary;
  String _animatedText = " ";
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    unit = screenHeight / 100;
    statusBarHeight = MediaQuery.of(context).padding.top;

    Widget _buildTitleBar() {
      return Container(
        height: unit * 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  child: Text(
                    "My Quarantina",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                        color: Renkler.dark),
                  ),
                ),
                IconButton(
                  onPressed: () => print("object"),
                  icon: Icon(Icons.announcement),
                  color: Renkler.dark,
                ),
              ]),
        ),
      );
    }

    Widget _buildDayCounter() {
      return Container(
        height: unit * 45,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            height: unit * 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Renkler.primary,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "15 Gün 17 saat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Renkler.dark),
              ),
            ),
          ),
        ),
      );
    }

    Widget _buildButtons() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: unit * 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 10, right: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _animatedColor == Renkler.secondary
                            ? _animatedColor = Renkler.third
                            : _animatedColor = Renkler.secondary;
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.third,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "İhlal Bildir!",
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 5, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      print("Geçmiş kayıtlar");
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.greenDark,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Geçmiş Kayıtlarım",
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildPoint() {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              if (_animatedText == " ") {
                setState(() {
                  _animatedColor = Renkler.green;
                  _isSelected = false;
                  _animatedText = "Hesaplanıyor...";
                });
                Timer timer = new Timer(new Duration(seconds: 5), () {
                  setState(() {
                    _isSelected = true;
                    _animatedText = "100%";
                  });
                });
              }
            },
            child: AnimatedContainer(
              height: _animatedHeight,
              width: _animatedWidth - 10,
              decoration: BoxDecoration(
                color: _animatedColor,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 5),
              curve: Curves.slowMiddle,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _isSelected ? "Puanınızı görmek için dokunun" : " ",
                            style: buttonTextStyle,
                          ),
                          SizedBox(height: 5),
                          Text(
                            _isSelected ? "Her gün değişir..." : " ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Renkler.pDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedDefaultTextStyle(
                      style: _isSelected
                          ? TextStyle(
                              fontSize: 60,
                              color: Renkler.primary,
                              fontWeight: FontWeight.bold)
                          : TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w100),
                      duration: const Duration(milliseconds: 1000),
                      child: Text(_animatedText, overflow: TextOverflow.fade),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget _buildInfoBar() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: _animatedHeight + 10,
            ),
            Container(
              height: unit * 15 - 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Renkler.pDark,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ],
        ),
      );
    }

    Widget _buildReport() {
      _animatedHeight = unit * 20;
      _animatedWidth = double.maxFinite;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
            height: (unit * 50) - (20 + statusBarHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Renkler.primary,
            ),
            child: Stack(
              children: <Widget>[
                _buildPoint(),
                _buildInfoBar(),
                _buildButtons(),
              ],
            )),
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            color: Renkler.primary,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: statusBarHeight),
                  _buildTitleBar(),
                  _buildDayCounter(),
                  _buildReport(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
