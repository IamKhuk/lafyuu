import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

import 'menu/account_screen.dart';
import 'menu/cart_screen.dart';
import 'menu/explore_screen.dart';
import 'menu/home_screen.dart';
import 'menu/offer_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> data = [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    OfferScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: data[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.white,
        selectedIconTheme: IconThemeData(color: AppTheme.blue),
        selectedItemColor: AppTheme.blue,
        unselectedItemColor: AppTheme.grey,
        selectedLabelStyle: TextStyle(
          color: AppTheme.blue,
          fontFamily: AppTheme.fontFamily,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppTheme.grey,
          fontFamily: AppTheme.fontFamily,
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: _selectedIndex == 0 ? AppTheme.blue : AppTheme.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: _selectedIndex == 1 ? AppTheme.blue : AppTheme.grey,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              color: _selectedIndex == 2 ? AppTheme.blue : AppTheme.grey,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/offer.svg',
              color: _selectedIndex == 3 ? AppTheme.blue : AppTheme.grey,
            ),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: _selectedIndex == 4 ? AppTheme.blue : AppTheme.grey,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
