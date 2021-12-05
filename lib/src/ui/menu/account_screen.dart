import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/ui/profile/profile_screen.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountScreen();
  }
}

class _AccountScreen extends State<AccountScreen> {
  bool onProfile = false;
  bool onOrder = false;
  bool onLocation = false;
  bool onPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 78,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppTheme.white,
              border: Border(bottom: BorderSide(color: AppTheme.light)),
            ),
            child: Row(
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.dark,
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: 0,
                bottom: 0,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        onProfile = true;
                        onOrder = false;
                        onLocation = false;
                        onPayment = false;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 56,
                    color: onProfile == true ? AppTheme.light : AppTheme.white,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/user.svg',
                          color: AppTheme.blue,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        onProfile = false;
                        onOrder = true;
                        onLocation = false;
                        onPayment = false;
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 56,
                    color: onOrder == true ? AppTheme.light : AppTheme.white,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/bag.svg',
                          color: AppTheme.blue,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Order',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        onProfile = false;
                        onOrder = false;
                        onLocation = true;
                        onPayment = false;
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 56,
                    color: onLocation == true ? AppTheme.light : AppTheme.white,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          color: AppTheme.blue,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        onProfile = false;
                        onOrder = false;
                        onLocation = false;
                        onPayment = true;
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 56,
                    color: onPayment == true ? AppTheme.light : AppTheme.white,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/credit_card.svg',
                          color: AppTheme.blue,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
