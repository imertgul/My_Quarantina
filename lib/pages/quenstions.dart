import 'package:flutter/material.dart';
import 'package:my_quarantina/utilities/constants.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  double screenHeight = 0;
  double statusBarHeight = 0;
  double unit = 0;

  Widget _buildTitleBar() {
    return Container(
      height: unit * 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Renkler.dark,
              ),
              FittedBox(
                child: Text(
                  "İhlal Bildirimi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Renkler.dark),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    unit = screenHeight / 100;
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Renkler.primary,
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: statusBarHeight),
                  _buildTitleBar(),
                  Container(
                    // height: unit * 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: unit * 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Renkler.secondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("hop"),
                          ),
                          Container(
                            height: unit * 5,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Soru 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Renkler.dark),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("pressed skip button");
                                    },
                                    child: Text(
                                      "Atla",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Renkler.dark),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
