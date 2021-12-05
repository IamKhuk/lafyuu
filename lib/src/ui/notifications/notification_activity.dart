import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/model/notification_activity_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class NotificationActivity extends StatefulWidget {

  @override
  _NotificationActivityState createState() => _NotificationActivityState();
}

class _NotificationActivityState extends State<NotificationActivity> {
  List<NotActivityModel> notActivity = [
    NotActivityModel('Transaction Nike Air Zoom Product', 'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo', 'April 30, 2021 1:01 PM'),
    NotActivityModel('Transaction Nike Air Zoom Pegasus 36 Miami', 'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor', 'March 25, 2021 3:01 PM'),
    NotActivityModel('Transaction Nike Air Max', 'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo', 'January 14, 2021 5:01 PM'),
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
          'Activities',
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
        itemCount: notActivity.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/transaction.svg', color: AppTheme.blue,),
                SizedBox(width: 12),
                Container(
                  width: MediaQuery.of(context).size.width-68,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notActivity[index].title,
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
                        notActivity[index].text,
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
                        notActivity[index].date,
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
