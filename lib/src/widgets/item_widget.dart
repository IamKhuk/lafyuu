import 'package:flutter/cupertino.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class ItemView extends StatelessWidget {
  final String text;
  final EdgeInsets margin;

  ItemView({
    required this.text,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: margin,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppTheme.blue,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 30,
            spreadRadius: 0,
            color: AppTheme.blue.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            height: 1.8,
            color: AppTheme.white,
          ),
        ),
      ),
    );
  }
}
