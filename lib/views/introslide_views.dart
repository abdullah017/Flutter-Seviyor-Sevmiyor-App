import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:seviyor_sevmiyor_app/views/home_views.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    bool isOpened = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoard', isOpened);
    print('İNTRO VALUE **** $isOpened');
    var a = prefs.getBool('onBoard');
    print('A VALUE **** $a');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeView()),
    );
  }

  Widget _buildImage(String assetName, [double width = 150]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Neden bu uygulamayı kullanmalıyız?",
          body:
              "Doğada,sokakta,bahçemizde ya da herhangi bir alanda bulunan güzelim bitkileri yolmamak için :)",
          image: _buildImage('papatya.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Nasıl kullanılır?",
          body:
              "Tek yapman gereken Çarkı Çevir butonuna basmak. Uygulamayı kullanmak bu kadar basit.",
          image: _buildImage('soru.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Son bir hatırlatma",
          body:
              "Unutma! Bu, ufak ve çevrimdışı uygulama tamamen eğlence odaklı. Bu yüzden sevdiklerini üzme! ;)",
          image: _buildImage('uyari.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Geç'),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Bitir',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
