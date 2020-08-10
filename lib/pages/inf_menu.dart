import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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
                  "Uyarılar",
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

  Widget _buildInfo() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: unit * 80 - statusBarHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Renkler.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Yeni Koronavirüs  solunum yolu enfeksiyonu yapan bir virüstür.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                  Text(
                    "Eğer öksürüyorsanız, ateşiniz varsa ve nefes almakta zorlanıyorsanız, cerrahi maske takarak en yakın sağlık kuruluşuna başvurun.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                  Text(
                    "En çok karşılaşılan belirtiler ateş, öksürük ve solunum sıkıntısıdır.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                  Text(
                    "Aile üyelerini korumak içinevde kendinizi izole edin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                  Text(
                    "Evde geçen süre boyuncaziyaretçi kabul etmeyin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Text(
                    "Bol sıvı tüketin, dengeli beslenin, uyku düzeninize dikkat edin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                  Text(
                    "Ellerinizi sık sık, su ve sabun ile en az yirmi saniye boyunca ovarak yıkayın.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                  Text(
                    "Evden çıkmak zorunda kalırsanız mutlaka maske takın.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Renkler.dark),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return Container(
      height: unit * 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Renkler.third,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Karantinayı Sıfırla",
                style: buttonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    unit = screenHeight / 100;
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: Renkler.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: statusBarHeight),
              _buildTitleBar(),
              _buildInfo(),
              _buildResetButton(),
            ],
          ),
        ),
      ),
    );
  }
}
