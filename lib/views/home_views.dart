import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:seviyor_sevmiyor_app/views/helper/size_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

 
  
  int selected = 0;
  late String endOfSpin;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: displayHeight(context) * 0.7,
              child: FortuneWheel(
                animateFirst: false,
                selected: selected,
                physics: CircularPanPhysics(
                  duration: Duration(seconds: 1),
                  curve: Curves.decelerate,
                ),
                onFling: () {
                  setState(() {
                    selected = Random().nextInt(7);
                  });
                },
                items: [
                  FortuneItem(
                    child: Text(
                      "SEVİYOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xffE50001),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "SEVMİYOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Colors.lightGreen,
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "KARARSIZ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xffFECB00),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "ARKADAŞ OLARAK GÖRÜYOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xff333333),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "ÇOK SEVİYOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xffF89400),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "HİÇ SEVMİYOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xff438602),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "AKLINDASIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xff9B289F),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                  FortuneItem(
                    child: Text(
                      "UNUT GİTSİN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xff5E274F),
                      borderColor: Colors.white,
                      borderWidth: 1,
                    ),
                  ),
                ],
                onAnimationEnd: () {
                  print("Value : " + "$selected");

                  switch (selected) {
                    case 0:
                      endOfSpin =
                          "YARABBİ ŞÜKÜR! ALLAH NAZARLARDAN SAKLASIN :)";
                      showAlert(context);
                      break;
                    case 1:
                      endOfSpin = "SONUÇ: KENDİ KAYBETTİ!";
                      showAlert(context);
                      break;
                    case 2:
                      endOfSpin =
                          "BİRAZ ÇABALASAK GİDER MİYİZ? NEREYE Mİ? TABİ Kİ HOŞUNA :)";
                      showAlert(context);
                      break;
                    case 3:
                      endOfSpin =
                          "BİZDE FARKLI GÖZLE BAKTIĞIMIZDAN BU UYGULAMAYI KULLANMIYORUZ DEĞİL Mİ CANIM ARKADAŞIMMM :(";
                      showAlert(context);
                      break;
                    case 4:
                      endOfSpin =
                          "İNSAN BAŞKA NE İSTER Kİ? EN FAZLA YUVAYI ŞENLENDİREN ÇOCUK :)";
                      showAlert(context);
                      break;
                    case 5:
                      endOfSpin =
                          "BİZE DEMİR ATACAK LİMAN MI YOK? HADİ KAPTAN DEMİR ATIYORUZ YALNIZLIĞA :(";
                      showAlert(context);
                      break;
                    case 6:
                      endOfSpin = "TAHMİNEN NE ZAMAN AKLINDAN GÖNLÜNE GİRERİM?";
                      showAlert(context);
                      break;
                    case 7:
                      endOfSpin = "BAZEN EN İYİSİ BUDUR! DAHA İYİ ŞEYLER İÇİN!";
                      showAlert(context);
                      break;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = Random().nextInt(7);
                  });
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      "ÇARKI ÇEVİR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(endOfSpin),
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected = Random().nextInt(4);
                    Navigator.of(context).pop();
                  });
                },
                child: Text('TEKRAR DENE'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
