import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/widgets/item_widget.dart';

class ChangeName extends StatefulWidget {
  final Function(String _firstName, String _lastName) changed;

  ChangeName(this.changed);

  @override
  _ChangeNameState createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  TextEditingController firstNameController =
      new TextEditingController(text: "Khusan");
  TextEditingController lastNameController =
      new TextEditingController(text: "Khukumov");

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
          'Name',
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
              'First Name',
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
                controller: firstNameController,
                autofocus: false,
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  height: 1.8,
                  letterSpacing: 0.5,
                  color: AppTheme.grey,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.light),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.blue),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Last Name',
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
                controller: lastNameController,
                autofocus: false,
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  height: 1.8,
                  letterSpacing: 0.5,
                  color: AppTheme.grey,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.light),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.blue),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                widget.changed(
                    firstNameController.text, lastNameController.text);
                Navigator.pop(context);
              },
              child: ItemView(margin: EdgeInsets.all(0), text: 'Save',),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
