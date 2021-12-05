import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/widgets/item_widget.dart';

class ProfileGender extends StatefulWidget {
  final Function(String _gender) changed;

  ProfileGender(this.changed);

  @override
  _ProfileGenderState createState() => _ProfileGenderState();
}

class _ProfileGenderState extends State<ProfileGender> {
  String male = 'Male';
  String female = 'Female';
  String other = 'Other';
  String gen = 'Male';

  bool onGen = false;

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
          'Gender',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Choose Gender',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: AppTheme.fontFamily,
                  height: 1.5,
                  letterSpacing: 0.5,
                  color: AppTheme.dark,
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    onGen = true;
                  });
                },
                child: Container(
                  height: 48,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: onGen == true ? AppTheme.blue : AppTheme.light),
                  ),
                  child: Row(
                    children: [
                      Text(
                        gen,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset('assets/icons/bottom.svg')
                    ],
                  ),
                ),
              ),
              onGen == true
                  ? Container(
                      height: 146,
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.light)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gen = male;
                                onGen = false;
                              });
                            },
                            child: Container(
                              height: 48,
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              child: Text(
                                male,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: AppTheme.fontFamily,
                                  letterSpacing: 0.5,
                                  height: 1.8,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gen = female;
                                onGen = false;
                              });
                            },
                            child: Container(
                              height: 48,
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              child: Text(
                                female,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: AppTheme.fontFamily,
                                  letterSpacing: 0.5,
                                  height: 1.8,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gen = other;
                                onGen = false;
                              });
                            },
                            child: Container(
                              height: 48,
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              child: Text(
                                other,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: AppTheme.fontFamily,
                                  letterSpacing: 0.5,
                                  height: 1.8,
                                  color: AppTheme.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.changed(gen);
                  });
                  Navigator.pop(context);
                },
                child: ItemView(
                  text: "Save",
                  margin: EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
