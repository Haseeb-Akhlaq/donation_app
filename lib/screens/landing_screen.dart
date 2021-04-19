import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venezuela_donation_app/screens/authScreen.dart';

import 'file:///C:/Users/haseeb/AndroidStudioProjects/venezuela_donation_app/lib/screens/bottomNavBar/bottomNavBar_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return BottomNavBarScreen();
        }
        return AuthScreen();
      },
    );
  }
}
