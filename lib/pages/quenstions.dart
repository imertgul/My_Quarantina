import 'package:flutter/material.dart';
import 'package:my_quarantina/utilities/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  CarouselController buttonCarouselController = CarouselController();
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

  Widget _buildQuestion(i) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: unit * 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Renkler.pDark,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    myQuestions[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Renkler.dark),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () => buttonCarouselController.nextPage(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Evet"),
                        Text("Hayır"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionFooter(i) {
    return Container(
      height: unit * 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Soru $i",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Renkler.dark),
              ),
              GestureDetector(
                onTap: () {
                  buttonCarouselController.nextPage();
                },
                child: Text(
                  "Atla",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Renkler.dark),
                ),
              ),
            ]),
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      height: unit * 40 - statusBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Soruları cevaplarken",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Renkler.dark),
          ),
          Text(
            "Cevaplarınız sizden başka kimse göremez.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Renkler.dark),
          ),
          Text(
            "Doğru yanıtları vermeye dikkat edin.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Renkler.dark),
          ),
          Text(
            "İstediğiniz soruyu atlayabilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Renkler.dark),
          ),
        ],
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
                  _buildInfo(),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: unit * 50, enableInfiniteScroll: false),
                    carouselController: buttonCarouselController,
                    items: [0, 1, 2, 3, 4, 5].map((i) {
                      return Column(
                        children: [
                          _buildQuestion(i),
                          _buildQuestionFooter(i),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
