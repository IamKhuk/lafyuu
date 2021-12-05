import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class ChangeEmail extends StatefulWidget {
  final Function(String _email) changed;
  ChangeEmail(this.changed);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  TextEditingController emailController = new TextEditingController();

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
          'Email',
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Change Email',
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
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: emailController,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Derlaxy@yahoo.com',
                    hintStyle: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.light),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 16, right: 10),
                      child: SvgPicture.asset('assets/icons/message.svg'),
                    )),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We Will Send verification to your New Email',
              style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                  letterSpacing: 0.5,
                  color: AppTheme.blue),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.changed(emailController.text);
                });
                Navigator.pop(context);
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppTheme.blue,
                ),
                child: Center(
                  child: Text(
                    'Change Email',
                    style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: AppTheme.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
