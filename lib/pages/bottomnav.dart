import 'package:awesomeals/pages/home_page.dart';
import 'package:awesomeals/pages/information.dart';
import 'package:awesomeals/pages/restaurants.dart';
import 'package:awesomeals/pages/wallet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order.dart';

const Color primaryColor = Color(0xFFFF9900);  // Orange
const Color lightBackground = Color(0xFFFFF3E0);  // Light orange for background
const Color accentColor = Color(0xFFF57C00);  // Darker orange for accents
const Color whiteColor = Colors.white;  // White for text and icons
const Color blueColor = Color(0xFF2C325D);

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Order orderPage;
  late Information informationPage;
  late Restaurant restaurantPage;
  late Wallet walletPage;

  @override
  void initState() {
    homePage = Home();
    orderPage = Order();
    informationPage = Information();
    restaurantPage = Restaurant();
    walletPage = Wallet();
    pages = [homePage, restaurantPage, orderPage, walletPage, informationPage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        color: blueColor,
        backgroundColor: primaryColor,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
        Icon(
            Icons.home_outlined,
            color: primaryColor
        ),
        Icon(
          Icons.menu_outlined,
          color: primaryColor
        ),
        Icon(
            Icons.person_outline,
            color: primaryColor
        ),
          Icon(
              Icons.wallet,
              color: primaryColor
          ),
        Icon(
            Icons.info_outline,
            color: primaryColor
        ),
      ],),
      body: pages[currentTabIndex],
    );
  }
}

