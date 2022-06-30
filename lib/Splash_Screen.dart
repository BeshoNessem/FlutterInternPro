import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_1/On_boarding.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 20),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Onboarding())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/images/Hospital building-bro.png',
                  width: 250,
                  height: 250,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: AnimatedTextKit(animatedTexts:[
                TyperAnimatedText("Hospital Managment System",textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              ]),
            ),
            CircularProgressIndicator(backgroundColor: Colors.greenAccent,),
          ],
        ),
      ),
    );
  }
}
