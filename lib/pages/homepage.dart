import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenHeight = 0;
  double statusBarHeight = 0;
  double unit = 0;
  double _animatedWidth = 50;
  double _animatedHeight = 50;
  Color _animatedColor = Renkler.third;
  String _animatedText = "Puanınızı görmek için tıklayınız!!";
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0),
                  ),
                ),
                IconButton(
                  onPressed: () => print("object"),
                  icon: Icon(Icons.announcement),
                  color: Colors.black,
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
              color: Renkler.pDark,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "15 Gün 17 saat",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
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
                      child: Center(
                        child: Text(
                          "İhlal Bildir!",
                          style: buttonTextStyle,
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
                        color: Renkler.secondary,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          "Geçmiş Kayıtlarım",
                          style: buttonTextStyle,
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
        padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _animatedWidth = unit * 20;
                // _borderRadius = BorderRadius.circular(500);
                _animatedColor = Renkler.green;
                _animatedText = "100%";
              });
            },
            child: AnimatedContainer(
              width: _animatedWidth,
              height: _animatedHeight,
              decoration: BoxDecoration(
                color: _animatedColor,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: Text(
                  _animatedText,
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Renkler.primary,
                      fontWeight: FontWeight.bold),
                ),
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
              height: _animatedHeight,
            ),
            Container(
              height: unit * 15 - 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Renkler.primary,
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
              color: Renkler.pDark,
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
