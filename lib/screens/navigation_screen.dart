
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
        floatingActionButton: SafeArea(
        child: FloatingActionButton(
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(),),);
         },
            child: Icon(
             Icons.qr_code,
              size: 20,),
           backgroundColor: Colors.cyan,
        ),),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons:[
            CupertinoIcons.home,
            CupertinoIcons.cart,
            CupertinoIcons.heart,
            CupertinoIcons.person_circle,
          ],
          activeIndex: pageIndex,
          inactiveColor: Colors.black.withOpacity(0.5),
          activeColor: Colors.cyan,
          elevation: 0,
          rightCornerRadius: 10,
          leftCornerRadius: 10,
          iconSize: 20,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        )
    );
  }
}