import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:seviyor_sevmiyor_app/views/home_views.dart';
import 'package:seviyor_sevmiyor_app/views/introslide_views.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? isOpen;

  @override
  void initState() {
    super.initState();
    Future<Null> _onBoardValue() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isOpen = (prefs.getBool('onBoard'));
      print('SPLASH A VALUE ******** $isOpen');
    }

    _onBoardValue().whenComplete(() {
      setState(() {
        print('İSOPEN VALUE******* $isOpen');
      });
    });
    _onBoardValue();
    print('İSOPEN VALUE******* $isOpen');
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      speed: 25,
      duration: 5000,
      imageSize: 500,
      imageSrc: "assets/seviyor.png",
      backgroundColor: Color(0xff9EF1FF),
      navigateRoute: isOpen == true ? HomeView() : OnBoardingPage(),
    );
  }
}
