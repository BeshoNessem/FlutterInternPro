import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Splash_Screen.dart';
Future<void> main () async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Splashscreen() ,
      ),
    );
  }
}
