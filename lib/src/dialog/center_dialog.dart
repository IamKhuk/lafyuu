import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class CenterDialog {
  static void showErrorDialog(
    BuildContext context,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Error",
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppTheme.dark,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 16,
              color: AppTheme.dark,
            ),
          ),
          actions: [
            GestureDetector(
              child: Container(
                color: Colors.transparent,
                height: 44,
                child: Center(
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 16,
                      height: 1.8,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                      color: AppTheme.dark,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static void showErrorFunction(
    BuildContext context,
    String message,
    Function() onDelete,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Error",
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 12,
              color: AppTheme.dark,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 16,
              color: AppTheme.dark,
            ),
          ),
          actions: [
            GestureDetector(
              child: Container(
                color: Colors.transparent,
                height: 44,
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      height: 1.5,
                      color: AppTheme.grey,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              child: Container(
                color: Colors.transparent,
                height: 44,
                child: Center(
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      height: 1.5,
                      color: AppTheme.grey,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onDelete();
              },
            ),
          ],
        );
      },
    );
  }
}
