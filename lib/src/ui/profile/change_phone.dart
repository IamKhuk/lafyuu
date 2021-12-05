import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/widgets/item_widget.dart';

class ChangePhone extends StatefulWidget {
  final Function(String _phone) changed;

  ChangePhone(this.changed);

  @override
  _ChangePhoneState createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  TextEditingController phoneController = new TextEditingController();
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
          'Phone Number',
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
              'Phone Number',
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
                controller: phoneController,
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
                  prefixIcon: Container(
                    width: 44,
                    margin: EdgeInsets.only(left: 8),
                    child: SvgPicture.asset('assets/icons/phone.svg', height: 24, width: 24,),
                  )
                ),
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                widget.changed(phoneFormat(phoneController.text));
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

phoneFormat(String k){
  if(k.length==12){
    List<int> n = k.split('').map(int.parse).toList();
    return '('+n[0].toString()+n[1].toString()+n[2].toString()+') '+n[3].toString()+n[4].toString()+'-'+n[5].toString()+n[6].toString()+n[7].toString()+'-'+n[8].toString()+n[9].toString()+'-'+n[10].toString()+n[11].toString();
  } else if(k.length==9){
    List<int> n = k.split('').map(int.parse).toList();
    return n[0].toString()+n[1].toString()+'-'+n[2].toString()+n[3].toString()+n[4].toString()+'-'+n[5].toString()+n[6].toString()+'-'+n[7].toString()+n[8].toString();
  } else {
    return k.toString();
  }
}
