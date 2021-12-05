import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class OfferScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OfferScreen();
  }
}

class _OfferScreen extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 78,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppTheme.white,
              border: Border(bottom: BorderSide(color: AppTheme.light)),
            ),
            child: Row(
              children: [
                Text(
                  'Offer',
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
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 0, top: 0),
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width-32,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Use “MEGSL” Cupon For\nGet 90%off',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: AppTheme.white,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 206,
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 0,
                        bottom: 0,
                      ),
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset('assets/images/promotion_image_01.png'),
                    ),
                    Container(
                      height: 206,
                      width: MediaQuery.of(context).size.width - 32,
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 0,
                        bottom: 0,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Super Flash Sale \n50% Off',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: AppTheme.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 41,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 41,
                                  width: 42,
                                  margin: EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '08',
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
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppTheme.white,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 4),
                                Container(
                                  height: 41,
                                  width: 42,
                                  margin: EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '34',
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
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppTheme.white,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 4),
                                Container(
                                  height: 41,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '52',
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: 206,
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 0,
                      ),
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset('assets/images/recommended_product_01.png'),
                    ),
                    Container(
                      height: 206,
                      width: MediaQuery.of(context).size.width - 32,
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 0,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '90% Off Super Mega\nSale',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: AppTheme.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Special birthday Lafyuu',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 1.8,
                              color: AppTheme.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
