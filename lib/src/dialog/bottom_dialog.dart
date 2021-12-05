import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class BottomDialog {
  static void showBottomUI(BuildContext context) {
    List<String> pic = [
      'assets/images/product_image_01.png',
      'assets/images/product_image_02.png',
      'assets/images/product_image_03.png',
      'assets/images/product_image_04.png',
      'assets/images/product_image_05.png',
      'assets/images/product_image_06.png',
    ];
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        // bool k = false;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 0,
              ),
              width: MediaQuery.of(context).size.width,
              // color: k ? AppTheme.white : AppTheme.red,
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppTheme.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Image.asset(
                            'assets/images/profile_picture.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'James Lawson',
                            style: TextStyle(
                              color: AppTheme.dark,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                color: AppTheme.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                color: AppTheme.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                color: AppTheme.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                color: AppTheme.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                color: AppTheme.light,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tair max are always very comfortable fit, clean and just perfect '
                        'in every way. just the box was too small and scrunched '
                        'the sneakers up a little bit, not sure if the box was '
                        'always this small but the 90s are and will always be one '
                        'of my favorites.',
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 12,
                      height: 1.8,
                      letterSpacing: 0.5,
                      color: AppTheme.grey,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 416,
                    width: 109,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: ListView.builder(
                      itemCount: pic.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 109,
                          width: 109,
                          margin: EdgeInsets.only(bottom: 16),
                          child: Image.asset(pic[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
