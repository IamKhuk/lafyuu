import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileBirthday extends StatefulWidget {
  final Function(String _date) changed;

  ProfileBirthday(this.changed);

  @override
  _ProfileBirthdayState createState() => _ProfileBirthdayState();
}

class _ProfileBirthdayState extends State<ProfileBirthday> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  String s = '';

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
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/left.svg'),
            ),
          ),
        ),
        title: Text(
          'Birthday',
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
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },

          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              s = dayFormat(_selectedDay.day)+"-"+dayFormat(_selectedDay.month)+"-"+_selectedDay.year.toString();
              widget.changed(s);
              Navigator.pop(context);
            },
            child: Container(
              color: AppTheme.red,
              height: 48,
            ),
          )
        ],
      ),
    );
  }
}

dayFormat(int k){
  if(k<=9){
    return '0'+k.toString();
  } else {
    return k.toString();
  }
}
