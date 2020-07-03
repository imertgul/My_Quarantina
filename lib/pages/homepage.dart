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
  double _animatedWidth = double.infinity;
  double _animatedHeight = 50;
  Color _animatedColor = Renkler.third;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(500);

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
              color: Colors.black12,
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
                        _animatedColor == Renkler.third
                            ? _animatedColor = Renkler.secondary
                            : _animatedColor = Renkler.third;
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
            ],
          ),
        ),
      );
    }

    Widget _buildReport() {
      _animatedHeight = unit * 20;
      _animatedWidth = unit * 20;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
            height: (unit * 50) - (20 + statusBarHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black12,
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    width: _animatedWidth,
                    height: _animatedHeight,
                    decoration: BoxDecoration(
                      color: _animatedColor,
                      borderRadius: _borderRadius,
                    ),
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: Center(
                      child: Text(
                        "%100",
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ),
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
            color: Colors.white,
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
