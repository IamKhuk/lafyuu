import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/model/reviews_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class WriteReview extends StatefulWidget {
  final ReviewsModel writeRev;

  WriteReview({required this.writeRev});

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        titleSpacing: 12,
        leadingWidth: 30,
        backgroundColor: AppTheme.white,
        leading: Container(
            margin: EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/left.svg',
                height: 12,
                width: 12,
              ),
            )),
        elevation: 1,
        shadowColor: AppTheme.light,
        centerTitle: false,
        title: Text(
          'Write Review',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.5,
            letterSpacing: 0.5,
            color: AppTheme.dark,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: EdgeInsets.only(bottom: 24),
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 16),
                Text(
                  'Please write Overall level of satisfaction with your shipping / Delivery Service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: 0.5,
                    color: AppTheme.dark,
                    fontFamily: AppTheme.fontFamily,
                  ),
                  maxLines: 2,
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
