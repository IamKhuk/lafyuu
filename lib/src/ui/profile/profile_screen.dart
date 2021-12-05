import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/ui/profile/profile_birthday.dart';
import 'package:lafyuu/src/ui/profile/profile_gender.dart';

import 'change_email.dart';
import 'change_name.dart';
import 'change_phone.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = 'Maximus';
  String lastName = 'Gold';
  String gender = 'Male';
  String email = 'Derlaxy@yahoo.com';
  String date = '09-06-2002';
  String phone = '(998) 97-001-55-97';
  String pass = '*************';

  // @override
  // void initState() {
  //   _getInfo();
  //   super.initState();
  // }


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
          'Profile',
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
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          Row(
            children: [
              Container(
                height: 72,
                width: 72,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(72),
                ),
                child: Image.asset(
                  'assets/images/profile_picture.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangeName((_firstName, _lastName) {
                              setState(() {
                                firstName = _firstName;
                                lastName = _lastName;
                              });
                            });
                          },
                        ),
                      );
                    },
                    child: Text(
                      firstName + ' ' + lastName,
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        letterSpacing: 0.5,
                        color: AppTheme.dark,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '@derlaxy',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileGender((_gender){
                      setState(() {
                        gender = _gender;
                      });
                    });
                  },
                ),
              );
            },
            child: Container(
              height: 54,
              //padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width - 32,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/gender.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Gender',
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
                  Row(
                    children: [
                      Text(
                        gender,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset('assets/icons/right.svg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileBirthday((_date){
                      setState(() {
                        date = _date;
                      });
                    });
                  },
                ),
              );
            },
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/date.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Birthday',
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
                  Row(
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset('assets/icons/right.svg'),
                    ],
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
                    return ChangeEmail((_email){
                      setState(() {
                        email = _email;
                      });
                    });
                  },
                ),
              );
            },
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/message.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Email',
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
                  Row(
                    children: [
                      Text(
                        email,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset('assets/icons/right.svg'),
                    ],
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
                    return ChangePhone((_phone){
                      setState(() {
                        phone = _phone;
                      });
                    });
                  },
                ),
              );
            },
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Container(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/sphone.svg',
                      color: AppTheme.blue,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Phone Number',
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
                    Row(
                      children: [
                        Text(
                          phone,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                        SizedBox(width: 16),
                        SvgPicture.asset('assets/icons/right.svg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/password.svg',
                    color: AppTheme.blue,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Change Password',
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
                  Row(
                    children: [
                      Text(
                        '•••••••••••••••••',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset('assets/icons/right.svg'),
                    ],
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
