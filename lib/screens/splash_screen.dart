import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:venezuela_donation_app/screens/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int backgroundImageNum = 1 + Random().nextInt(4).toInt();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LandingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/splashPic$backgroundImageNum.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, 90));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  color: Colors.yellow,
                  child: Container(
                    margin: EdgeInsets.only(top: 150),
                    child: SpinKitWave(
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 250,
              child: Image.asset('assets/logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
