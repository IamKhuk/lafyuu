import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

import 'notification_activity.dart';
import 'notification_feed.dart';
import 'notification_offer.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leadingWidth: 30,
        titleSpacing: 12,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/left.svg'),
            ),
          ),
        ),
        title: Text(
          'Notifications',
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
        centerTitle: false,
        elevation: 1,
        shadowColor: AppTheme.light,
        backgroundColor: AppTheme.white,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NotificationOffer();
                  },
                ),
              );
            },
            child: Container(
              height: 56,
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/offer.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Offer',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: AppTheme.dark,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.red,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NotificationFeed();
                  },
                ),
              );
            },
            child: Container(
              height: 56,
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/list.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Feed',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: AppTheme.dark,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.red,
                    ),
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NotificationActivity();
                  },
                ),
              );
            },
            child: Container(
              height: 56,
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Activity',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: AppTheme.dark,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.red,
                    ),
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
