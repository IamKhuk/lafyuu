import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/model/reviews_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class ReviewProduct extends StatefulWidget {
  @override
  _ReviewProductState createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  List<ReviewsModel> review = [
    ReviewsModel(
      'assets/images/profile_picture.png',
      'James Lawson',
      5,
      'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
      [
        'assets/images/product_img_01.png',
        'assets/images/product_img_02.png',
        'assets/images/product_img_03.png'
      ],
      'December 10, 2016',
    ),
    ReviewsModel(
      'assets/images/profile_picture_02.png',
      'Laura Octavian',
      4,
      'This is really amazing product, i like the design of product, I hope can buy it again!',
      [],
      'February 21, 2017',
    ),
    ReviewsModel(
      'assets/images/profile_picture.png',
      'James Lawson',
      1,
      'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
      [
        'assets/images/product_img_01.png',
        'assets/images/product_img_02.png',
        'assets/images/product_img_03.png'
      ],
      'December 10, 2016',
    ),
    ReviewsModel(
      'assets/images/profile_picture_03.png',
      'Johnson Bridge',
      5,
      'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit',
      [],
      'March 2, 2019',
    ),
    ReviewsModel(
      'assets/images/profile_picture.png',
      'James Lawson',
      2,
      'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
      [
        'assets/images/product_img_01.png',
        'assets/images/product_img_02.png',
        'assets/images/product_img_03.png'
      ],
      'December 10, 2016',
    ),
    ReviewsModel(
      'assets/images/profile_picture_04.png',
      'Griffin Rod',
      5,
      'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small',
      [
        'assets/images/product_img_02.png',
        'assets/images/product_img_01.png',
      ],
      'June 9, 2018',
    ),
    ReviewsModel(
      'assets/images/profile_picture.png',
      'James Lawson',
      3,
      'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
      [
        'assets/images/product_img_01.png',
        'assets/images/product_img_02.png',
        'assets/images/product_img_03.png'
      ],
      'December 10, 2016',
    ),
  ];

  List<ReviewsModel> rev1 = [];
  List<ReviewsModel> rev2 = [];
  List<ReviewsModel> rev3 = [];
  List<ReviewsModel> rev4 = [];
  List<ReviewsModel> rev5 = [];

  List<int> revStar = [
    1,
    2,
    3,
    4,
    5,
  ];

  bool onReview = true;
  bool onRevStar1 = false;
  bool onRevStar2 = false;
  bool onRevStar3 = false;
  bool onRevStar4 = false;
  bool onRevStar5 = false;

  int onStar = 0;

  @override
  Widget build(BuildContext context) {
    int itemCount = onStar == 0
        ? review.length
        : onStar == 1
            ? onStar == 1
                ? rev1.length
                : 0
            : onStar == 2
                ? onStar == 2
                    ? rev2.length
                    : 0
                : onStar == 3
                    ? onStar == 3
                        ? rev3.length
                        : 0
                    : onStar == 4
                        ? onStar == 4
                            ? rev4.length
                            : 0
                        : onStar == 4
                            ? onStar == 5
                                ? rev5.length
                                : 0
                            : 0;
    rev1 = [];
    rev2 = [];
    rev3 = [];
    rev4 = [];
    rev5 = [];
    for (int i = 0; i < review.length; i++) {
      if (review[i].star == 1) {
        rev1.add(review[i]);
      }
      if (review[i].star == 2) {
        rev2.add(review[i]);
      }
      if (review[i].star == 3) {
        rev3.add(review[i]);
      }
      if (review[i].star == 4) {
        rev4.add(review[i]);
      }
      if (review[i].star == 5) {
        rev5.add(review[i]);
      }
    }

    return Scaffold(
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
          review.length.toString() + ' Reviews',
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
      body: ListView(
        padding: EdgeInsets.only(bottom: 0),
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onReview = true;
                          onRevStar1 = false;
                          onRevStar2 = false;
                          onRevStar3 = false;
                          onRevStar4 = false;
                          onRevStar5 = false;
                          onStar = 0;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: onReview == true
                                ? AppTheme.blue.withOpacity(0.1)
                                : AppTheme.white,
                            border: Border.all(
                              color: onReview == true
                                  ? AppTheme.blue.withOpacity(0.1)
                                  : AppTheme.light,
                            )),
                        child: Center(
                          child: Text(
                            'All Review',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: AppTheme.fontFamily,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: AppTheme.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onReview = false;
                          onRevStar1 = true;
                          onRevStar2 = false;
                          onRevStar3 = false;
                          onRevStar4 = false;
                          onRevStar5 = false;
                          onStar = 1;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 75,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: onRevStar1 == true
                                  ? AppTheme.blue.withOpacity(0.1)
                                  : AppTheme.light),
                          color: onRevStar1 == true
                              ? AppTheme.blue.withOpacity(0.1)
                              : AppTheme.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star_12px.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onReview = false;
                          onRevStar1 = false;
                          onRevStar2 = true;
                          onRevStar3 = false;
                          onRevStar4 = false;
                          onRevStar5 = false;
                          onStar = 2;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 75,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: onRevStar2 == true
                                  ? AppTheme.blue.withOpacity(0.1)
                                  : AppTheme.light),
                          color: onRevStar2 == true
                              ? AppTheme.blue.withOpacity(0.1)
                              : AppTheme.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star_12px.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onReview = false;
                          onRevStar1 = false;
                          onRevStar2 = false;
                          onRevStar3 = true;
                          onRevStar4 = false;
                          onRevStar5 = false;
                          onStar = 3;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 75,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: onRevStar3 == true
                                  ? AppTheme.blue.withOpacity(0.1)
                                  : AppTheme.light),
                          color: onRevStar3 == true
                              ? AppTheme.blue.withOpacity(0.1)
                              : AppTheme.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star_12px.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '3',
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onReview = false;
                          onRevStar1 = false;
                          onRevStar2 = false;
                          onRevStar3 = false;
                          onRevStar4 = true;
                          onRevStar5 = false;
                          onStar = 4;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 75,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: onRevStar4 == true
                                  ? AppTheme.blue.withOpacity(0.1)
                                  : AppTheme.light),
                          color: onRevStar4 == true
                              ? AppTheme.blue.withOpacity(0.1)
                              : AppTheme.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star_12px.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onReview = false;
                          onRevStar1 = false;
                          onRevStar2 = false;
                          onRevStar3 = false;
                          onRevStar4 = false;
                          onRevStar5 = true;
                          onStar = 5;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 75,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: onRevStar5 == true
                                  ? AppTheme.blue.withOpacity(0.1)
                                  : AppTheme.light),
                          color: onRevStar5 == true
                              ? AppTheme.blue.withOpacity(0.1)
                              : AppTheme.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star_12px.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '5',
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width - 32,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                int imgLength = review[index].img.length;
                return Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(onStar == 0
                              ? review[index].pfp
                              : onStar == 1
                                  ? rev1[index].pfp
                                  : onStar == 2
                                      ? rev2[index].pfp
                                      : onStar == 3
                                          ? rev3[index].pfp
                                          : onStar == 4
                                              ? rev4[index].pfp
                                              : rev5[index].pfp),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onStar == 0
                                    ? review[index].name
                                    : onStar == 1
                                        ? rev1[index].name
                                        : onStar == 2
                                            ? rev2[index].name
                                            : onStar == 3
                                                ? rev3[index].name
                                                : onStar == 4
                                                    ? rev4[index].name
                                                    : rev5[index].name,
                                style: TextStyle(
                                  color: AppTheme.dark,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  height: 1.5,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 4),
                              onStar == 0
                                  ? Container(
                                      height: 16,
                                      child: review[index].star == 5
                                          ? Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/star_12x.svg',
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/icons/star_12x.svg',
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/icons/star_12x.svg',
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/icons/star_12x.svg',
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                SizedBox(width: 4),
                                                SvgPicture.asset(
                                                  'assets/icons/star_12x.svg',
                                                  height: 16,
                                                  width: 16,
                                                ),
                                              ],
                                            )
                                          : review[index].star == 4
                                              ? Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/star_12x.svg',
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    SvgPicture.asset(
                                                      'assets/icons/star_12x.svg',
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    SvgPicture.asset(
                                                      'assets/icons/star_12x.svg',
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    SvgPicture.asset(
                                                      'assets/icons/star_12x.svg',
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    SvgPicture.asset(
                                                      'assets/icons/star_12x_empty.svg',
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                  ],
                                                )
                                              : review[index].star == 3
                                                  ? Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/star_12x.svg',
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        SizedBox(width: 4),
                                                        SvgPicture.asset(
                                                          'assets/icons/star_12x.svg',
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        SizedBox(width: 4),
                                                        SvgPicture.asset(
                                                          'assets/icons/star_12x.svg',
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        SizedBox(width: 4),
                                                        SvgPicture.asset(
                                                          'assets/icons/star_12x_empty.svg',
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        SizedBox(width: 4),
                                                        SvgPicture.asset(
                                                          'assets/icons/star_12x_empty.svg',
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                      ],
                                                    )
                                                  : review[index].star == 2
                                                      ? Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(width: 4),
                                                            SvgPicture.asset(
                                                              'assets/icons/star_12x_empty.svg',
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                          ],
                                                        ),
                                    )
                                  : onStar == 1
                                      ? Container(
                                          height: 16,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/star_12x.svg',
                                                height: 16,
                                                width: 16,
                                              ),
                                              SizedBox(width: 4),
                                              SvgPicture.asset(
                                                'assets/icons/star_12x_empty.svg',
                                                height: 16,
                                                width: 16,
                                              ),
                                              SizedBox(width: 4),
                                              SvgPicture.asset(
                                                'assets/icons/star_12x_empty.svg',
                                                height: 16,
                                                width: 16,
                                              ),
                                              SizedBox(width: 4),
                                              SvgPicture.asset(
                                                'assets/icons/star_12x_empty.svg',
                                                height: 16,
                                                width: 16,
                                              ),
                                              SizedBox(width: 4),
                                              SvgPicture.asset(
                                                'assets/icons/star_12x_empty.svg',
                                                height: 16,
                                                width: 16,
                                              ),
                                            ],
                                          ),
                                        )
                                      : onStar == 2
                                          ? Container(
                                              height: 16,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/star_12x.svg',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                    'assets/icons/star_12x.svg',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                    'assets/icons/star_12x_empty.svg',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                    'assets/icons/star_12x_empty.svg',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                    'assets/icons/star_12x_empty.svg',
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                ],
                                              ))
                                          : onStar == 3
                                              ? Container(
                                                  height: 16,
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/star_12x.svg',
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      SvgPicture.asset(
                                                        'assets/icons/star_12x.svg',
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      SvgPicture.asset(
                                                        'assets/icons/star_12x.svg',
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      SvgPicture.asset(
                                                        'assets/icons/star_12x_empty.svg',
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                      SizedBox(width: 4),
                                                      SvgPicture.asset(
                                                        'assets/icons/star_12x_empty.svg',
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ],
                                                  ))
                                              : onStar == 4
                                                  ? Container(
                                                      height: 16,
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x_empty.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                        ],
                                                      ))
                                                  : Container(
                                                      height: 16,
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          SizedBox(width: 4),
                                                          SvgPicture.asset(
                                                            'assets/icons/star_12x.svg',
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                        ],
                                                      ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        onStar == 0
                            ? review[index].text
                            : onStar == 1
                                ? rev1[index].text
                                : onStar == 2
                                    ? rev2[index].text
                                    : onStar == 3
                                        ? rev3[index].text
                                        : onStar == 4
                                            ? rev4[index].text
                                            : rev5[index].text,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 12,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                      ),
                      imgLength > 0 && onStar == 0
                          ? Container(
                              height: 72,
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: ListView.builder(
                                itemCount: imgLength,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return Container(
                                    height: 72,
                                    width: 72,
                                    margin: EdgeInsets.only(right: 16),
                                    child: Image.asset(onStar == 0
                                        ? review[index].img[i]
                                        : onStar == 1
                                            ? rev1[index].img[i]
                                            : onStar == 2
                                                ? rev2[index].img[i]
                                                : onStar == 3
                                                    ? rev3[index].img[i]
                                                    : onStar == 4
                                                        ? rev4[index].img[i]
                                                        : rev5[index].img[i]),
                                  );
                                },
                              ),
                            )
                          : rev1[index].img.length > 0 && onStar == 1
                              ? rev1[index].img.length == 0 && onStar == 1
                                  ? Container()
                                  : Container(
                                      height: 72,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: ListView.builder(
                                        itemCount: rev1[index].img.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, i) {
                                          return Container(
                                            height: 72,
                                            width: 72,
                                            margin: EdgeInsets.only(right: 16),
                                            child: Image.asset(onStar == 0
                                                ? review[index].img[i]
                                                : onStar == 1
                                                    ? rev1[index].img[i]
                                                    : onStar == 2
                                                        ? rev2[index].img[i]
                                                        : onStar == 3
                                                            ? rev3[index].img[i]
                                                            : onStar == 4
                                                                ? rev4[index]
                                                                    .img[i]
                                                                : rev5[index]
                                                                    .img[i]),
                                          );
                                        },
                                      ),
                                    )
                              : rev2[index].img.length > 0 && onStar == 2
                                  ? rev2[index].img.length == 0 && onStar == 2
                                      ? Container()
                                      : Container(
                                          height: 72,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: ListView.builder(
                                            itemCount: rev2[index].img.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, i) {
                                              return Container(
                                                height: 72,
                                                width: 72,
                                                margin:
                                                    EdgeInsets.only(right: 16),
                                                child: Image.asset(onStar == 0
                                                    ? review[index].img[i]
                                                    : onStar == 1
                                                        ? rev1[index].img[i]
                                                        : onStar == 2
                                                            ? rev2[index].img[i]
                                                            : onStar == 3
                                                                ? rev3[index]
                                                                    .img[i]
                                                                : onStar == 4
                                                                    ? rev4[index]
                                                                        .img[i]
                                                                    : rev5[index]
                                                                        .img[i]),
                                              );
                                            },
                                          ),
                                        )
                                  : rev3[index].img.length > 0 && onStar == 3
                                      ? rev3[index].img.length == 0 &&
                                              onStar == 3
                                          ? Container()
                                          : Container(
                                              height: 72,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 16),
                                              child: ListView.builder(
                                                itemCount:
                                                    rev3[index].img.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, i) {
                                                  return Container(
                                                    height: 72,
                                                    width: 72,
                                                    margin: EdgeInsets.only(
                                                        right: 16),
                                                    child: Image.asset(onStar ==
                                                            0
                                                        ? review[index].img[i]
                                                        : onStar == 1
                                                            ? rev1[index].img[i]
                                                            : onStar == 2
                                                                ? rev2[index]
                                                                    .img[i]
                                                                : onStar == 3
                                                                    ? rev3[index]
                                                                        .img[i]
                                                                    : onStar ==
                                                                            4
                                                                        ? rev4[index].img[
                                                                            i]
                                                                        : rev5[index]
                                                                            .img[i]),
                                                  );
                                                },
                                              ),
                                            )
                                      : rev4[index].img.length > 0 &&
                                              onStar == 4
                                          ? rev4[index].img.length == 0 &&
                                                  onStar == 4
                                              ? Container()
                                              : Container(
                                                  height: 72,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  child: ListView.builder(
                                                    itemCount:
                                                        rev4[index].img.length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context, i) {
                                                      return Container(
                                                        height: 72,
                                                        width: 72,
                                                        margin: EdgeInsets.only(
                                                            right: 16),
                                                        child: Image.asset(onStar ==
                                                                0
                                                            ? review[index]
                                                                .img[i]
                                                            : onStar == 1
                                                                ? rev1[index]
                                                                    .img[i]
                                                                : onStar == 2
                                                                    ? rev2[index]
                                                                        .img[i]
                                                                    : onStar ==
                                                                            3
                                                                        ? rev3[index]
                                                                            .img[i]
                                                                        : onStar == 4
                                                                            ? rev4[index].img[i]
                                                                            : rev5[index].img[i]),
                                                      );
                                                    },
                                                  ),
                                                )
                                          : rev5[index].img.length > 0 &&
                                                  onStar == 5
                                              ? rev5[index].img.length == 0 &&
                                                      onStar == 5
                                                  ? Container()
                                                  : Container(
                                                      height: 72,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 16),
                                                      child: ListView.builder(
                                                        itemCount: rev5[index]
                                                            .img
                                                            .length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, i) {
                                                          return Container(
                                                            height: 72,
                                                            width: 72,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 16),
                                                            child: Image.asset(onStar ==
                                                                    0
                                                                ? review[index]
                                                                    .img[i]
                                                                : onStar == 1
                                                                    ? rev1[index]
                                                                        .img[i]
                                                                    : onStar ==
                                                                            2
                                                                        ? rev2[index]
                                                                            .img[i]
                                                                        : onStar == 3
                                                                            ? rev3[index].img[i]
                                                                            : onStar == 4
                                                                                ? rev4[index].img[i]
                                                                                : rev5[index].img[i]),
                                                          );
                                                        },
                                                      ),
                                                    )
                                              : Container(
                                                  height: 16,
                                                ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            onStar == 0
                                ? review[index].date
                                : onStar == 1
                                    ? rev1[index].date
                                    : onStar == 2
                                        ? rev2[index].date
                                        : onStar == 3
                                            ? rev3[index].date
                                            : onStar == 4
                                                ? rev4[index].date
                                                : rev5[index].date,
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: AppTheme.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            child: Container(
              height: 60,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: AppTheme.blue,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 30,
                    spreadRadius: 0,
                    color: AppTheme.blue.withOpacity(0.24),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "Write Review",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.8,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
