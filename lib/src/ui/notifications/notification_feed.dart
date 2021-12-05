import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/model/notification_feed_modul.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class NotificationFeed extends StatefulWidget {
  @override
  _NotificationFeedState createState() => _NotificationFeedState();
}

class _NotificationFeedState extends State<NotificationFeed> {
  List<NotFeedModel> notFeed = [
    NotFeedModel('assets/images/feed_img_01.png', 'New Product', 'Nike Air Zoom Pegasus 36 Miami - Special For your Activity', 'June 3, 2021 5:06 PM'),
    NotFeedModel('assets/images/feed_img_02.png', 'Best Product', 'Nike 36 Miami - Special For your Activity', 'May 12, 2021 1:06 PM'),
    NotFeedModel('assets/images/feed_img_03.png', 'Super Product', 'Nike Air Zoom Pegasus 36 Miami - Special For your Activity', 'February 9, 2021 9:06 PM'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leadingWidth: 30,
        titleSpacing: 12,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: SvgPicture.asset('assets/icons/left.svg'),
          ),
        ),
        title: Text(
          'Feed',
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
      body: ListView.builder(
        itemCount: notFeed.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(notFeed[index].img),
                SizedBox(width: 12),
                Container(
                  width: MediaQuery.of(context).size.width-92,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notFeed[index].title,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: AppTheme.dark,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        notFeed[index].text,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        notFeed[index].date,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.dark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
