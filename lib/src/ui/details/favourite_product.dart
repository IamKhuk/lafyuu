import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/dialog/center_dialog.dart';
import 'package:lafyuu/src/model/favourite_product_model.dart';
import 'package:lafyuu/src/model/reviews_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/ui/details/product_details.dart';

class FavouriteProduct extends StatefulWidget {
  @override
  _FavouriteProductState createState() => _FavouriteProductState();
}

class _FavouriteProductState extends State<FavouriteProduct> {
  List<FavouriteModel> fav = [
    FavouriteModel('assets/images/fav_product_01.png',
        'Nike Air Max 270 React ENG', 4, 534.33, 24),
    FavouriteModel('assets/images/fav_product_02.png',
        'Nike Air Max 270 React ENG', 5, 472.75, 25),
    FavouriteModel('assets/images/fav_product_03.png',
        'Nike Air Max 270 React ENG', 4, 390.5, 18),
    FavouriteModel('assets/images/fav_product_04.png',
        'Nike Air Max 270 React ENG', 5, 445.25, 15),
    FavouriteModel('assets/images/product_image_06.png',
        'Nike Air Max 270 React ENG', 5, 445.25, 15),
  ];

  List<ReviewsModel> rev =[
    ReviewsModel('','',1,'', [], ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        titleSpacing: 12,
        backgroundColor: AppTheme.white,
        elevation: 1,
        leadingWidth: 40,
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/left.svg',
              height: 24,
              width: 14,
            ),
          ),
        ),
        title: Text(
          // widget.message,
          'Favourite Products',
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
        shadowColor: AppTheme.light,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: (fav.length + 1) ~/ 2,
          padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 16),
          itemBuilder: (context, index) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetails(
                            data: fav[index * 2], rev: rev[index*2],
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 12),
                    width: (MediaQuery.of(context).size.width - 44) / 2,
                    height: 289,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.light),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: fav[index * 2].image,
                            child: Image.asset(
                              fav[index * 2].image,
                              height: 133,
                              width: 133,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            fav[index * 2].name,
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: AppTheme.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: 12,
                            child: fav[index * 2].star == 5
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                              ],
                            )
                                : fav[index * 2].star == 4
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            )
                                : fav[index * 2].star == 3
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            )
                                : fav[index * 2].star == 2
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            )
                                : Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '\$' +
                                (fav[index * 2].price *
                                    (100 - fav[index * 2].sale) /
                                    100)
                                    .toString(),
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.8,
                              letterSpacing: 0.5,
                              color: AppTheme.blue,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      '\$' + fav[index * 2].price.toString(),
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        height: 1.5,
                                        letterSpacing: 0.5,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      fav[index * 2].sale.toString() + '% Off',
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        height: 1.5,
                                        letterSpacing: 0.5,
                                        color: AppTheme.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  CenterDialog.showErrorFunction(
                                    context,
                                    'Are you sure you want to delete?',
                                        () {
                                      setState(() {
                                        fav.removeAt(index * 2);
                                      });
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/trash.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                index * 2 + 1 >= fav.length
                    ? Container()
                    : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetails(
                            data: fav[index * 2 + 1], rev: rev[index * 2 + 1],
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 12),
                    width: (MediaQuery.of(context).size.width - 44) / 2,
                    height: 289,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.light),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            fav[index * 2 + 1].image,
                            height: 133,
                            width: 133,
                          ),
                          SizedBox(height: 8),
                          Text(
                            fav[index * 2 + 1].name,
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.5,
                              letterSpacing: 0.5,
                              color: AppTheme.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: 12,
                            child: fav[index * 2 + 1].star == 5
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                              ],
                            )
                                : fav[index * 2 + 1].star == 4
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            )
                                : fav[index * 2 + 1].star == 3
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            )
                                : fav[index * 2 + 1].star == 2
                                ? Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            )
                                : Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/star_12x.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                                SizedBox(width: 2),
                                SvgPicture.asset(
                                    'assets/icons/star_12x_empty.svg'),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '\$' +
                                (fav[index * 2 + 1].price *
                                    (100 - fav[index * 2 + 1].sale) /
                                    100)
                                    .toString(),
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.8,
                              letterSpacing: 0.5,
                              color: AppTheme.blue,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      '\$' +
                                          fav[index * 2 + 1]
                                              .price
                                              .toString(),
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        height: 1.5,
                                        letterSpacing: 0.5,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      fav[index * 2 + 1].sale.toString() +
                                          '% Off',
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        height: 1.5,
                                        letterSpacing: 0.5,
                                        color: AppTheme.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  CenterDialog.showErrorFunction(
                                    context,
                                    'Are you sure you want to delete?',
                                        () {
                                      setState(
                                            () {
                                          fav.removeAt(index * 2 + 1);
                                        },
                                      );
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/trash.svg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // index * 2 + 1 >= fav.length
                //     ? Container()
                //     : GestureDetector(
                //         child: Container(
                //           margin: EdgeInsets.only(top: 12),
                //           width: (MediaQuery.of(context).size.width - 44) / 2,
                //           height: 250,
                //           color: AppTheme.yellow,
                //           child: Center(
                //             child: Text((index * 2 + 1).toString()),
                //           ),
                //         ),
                //         onTap: () {
                //           BottomDialog.showBottomUI(context);
                //         },
                //       ),
              ],
            );
          },
        ),
      ),
    );
  }
}