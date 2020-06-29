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

    Widget _buildReport() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: (unit * 50) - (20 + statusBarHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black12,
          ),
        ),
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
