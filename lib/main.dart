import 'package:flutter/material.dart';
import 'package:tml/Halaman/Lupapassword.dart';
import 'package:tml/Halaman/Login.dart';
import 'package:tml/Halaman/MenuUtama.dart';
import 'package:tml/Halaman/Register.dart';
import 'package:tml/Halaman/Splas.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi',
      initialRoute: Routes.splash, 
      routes: Routes.getRoutes(), 
    );
  }
}

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String mainScreen = '/main-screen';


  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => Splas(),
      login: (context) => Login(),
      register: (context) => Register(),
      forgotPassword: (context) => LupaPassword(),
      mainScreen: (context) => MenuUtama(),
    };
  }
}
