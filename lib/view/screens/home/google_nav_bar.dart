import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';

import '../camera/my_garden.dart';
import '../community/plants_community.dart';
import '../live_stream/live_stream.dart';
import 'home.dart';

class GoogleNavBar extends StatefulWidget {
  const GoogleNavBar({super.key});

  @override
  _GoogleNavBarState createState() => _GoogleNavBarState();
}

class _GoogleNavBarState extends State<GoogleNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    LiveStream(),
    MyGarden(),
    PlantsCommunity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBF1D3),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color:const Color(0xff5F6F52) ,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color(0xff98A668),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: IconlyLight.home,
                  text: 'Home',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.play_circle_outline,
                  text: 'Live',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.yard_outlined,
                  text: 'My Farm',
                  iconSize: 30,
                ),
                GButton(
                  icon: IconlyLight.user_1,
                  text: 'Community',
                  iconSize: 30,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}





