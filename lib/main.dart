import 'package:flutter/material.dart';
import 'package:seviyor_sevmiyor_app/views/splash_views.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool isView;
void main() async {
// WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   isView =  prefs.getBool('onBoard')!;
//   await prefs.setBool('onBoard', value)
//   print('MAİN PREFS VALUE**** = $isView');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }
}
