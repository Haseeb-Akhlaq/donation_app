import 'package:flutter/material.dart';
import 'package:venezuela_donation_app/screens/bottomNavBar/youtube_screen.dart';

import 'file:///C:/Users/haseeb/AndroidStudioProjects/venezuela_donation_app/lib/screens/bottomNavBar/home_screen.dart';
import 'file:///C:/Users/haseeb/AndroidStudioProjects/venezuela_donation_app/lib/screens/bottomNavBar/profile_screen.dart';
import 'file:///C:/Users/haseeb/AndroidStudioProjects/venezuela_donation_app/lib/screens/bottomNavBar/subscriptionScreen.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedIndex = 0;
  PageController _pageController = PageController();

  void changeIndex({index}) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(selectedIndex,
          duration: Duration(microseconds: 600), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            print(selectedIndex);
            selectedIndex = index;
            _pageController.animateToPage(selectedIndex,
                duration: Duration(microseconds: 600), curve: Curves.linear);
          });
        },
        elevation: 10,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Subscription'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection,
              ),
              label: 'Youtube'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          HomeScreen(),
          SubscriptionScreen(),
          YoutubeScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
