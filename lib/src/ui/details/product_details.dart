import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/model/favourite_product_model.dart';
import 'package:lafyuu/src/model/recomendation_model.dart';
import 'package:lafyuu/src/model/reviews_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/ui/reviews/review_product.dart';

class ProductDetails extends StatefulWidget {
  final FavouriteModel data;
  final ReviewsModel rev;

  ProductDetails({required this.data, required this.rev});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int k = 0;
  int y = 0;
  int x = 0;

  List<RecommendationModel> rec = [
    RecommendationModel('assets/images/product_image_02.png',
        'FS - Nike Air Max 270 React', 299.43, 24),
    RecommendationModel('assets/images/product_image_01.png',
        'Nike Air Max 270 React ENG', 310.5, 21),
    RecommendationModel('assets/images/product_image_03.png',
        'Nike Air Zoom Pegasus 36 Miami', 190.75, 19),
    RecommendationModel('assets/images/product_image_04.png',
        'FS - Nike Air Max 270 React', 435.45, 33),
    RecommendationModel('assets/images/product_image_05.png',
        'Nike Air Max 270 React ENG', 128.25, 15),
    RecommendationModel('assets/images/product_image_06.png',
        'FS - Nike Air Max 270 React', 299.43, 24),
  ];

  List<String> size = [
    '5.5',
    '6',
    '6.5',
    '7',
    '7.5',
    '8',
    '8.5',
    '9',
  ];

  List color = [
    AppTheme.yellow,
    AppTheme.red,
    AppTheme.green,
    AppTheme.dark,
    AppTheme.blue,
    AppTheme.grey,
    AppTheme.purple,
  ];

  bool onLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 12,
        leadingWidth: 30,
        backgroundColor: AppTheme.white,
        elevation: 1,
        shadowColor: AppTheme.light,
        centerTitle: false,
        leading: Container(
          margin: EdgeInsets.only(left: 8),
          child: GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/left.svg',
              height: 24,
              width: 14,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          widget.data.name,
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
        actions: [
          SvgPicture.asset(
            'assets/icons/search.svg',
            width: 24,
            height: 24,
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/more.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      backgroundColor: AppTheme.white,
      body: ListView(
        padding: EdgeInsets.only(bottom: 24),
        children: [
          Hero(
            tag: widget.data.image,
            child: Image.asset(
              widget.data.image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 8,
            child: Row(
              children: [
                Expanded(child: Container()),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.light,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.light,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.blue,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.light,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.light,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  // widget.password,
                  widget.data.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.5,
                    fontFamily: AppTheme.fontFamily,
                    color: AppTheme.dark,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onLike = !onLike;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/like.svg',
                    color: onLike == false ? AppTheme.grey : AppTheme.red,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            height: 16,
            child: widget.data.star == 5
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
                : widget.data.star == 4
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
                    : widget.data.star == 3
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
                        : widget.data.star == 2
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
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              '\$' + widget.data.price.toString(),
              style: TextStyle(
                color: AppTheme.blue,
                fontFamily: AppTheme.fontFamily,
                fontSize: 20,
                height: 1.5,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
            ),
            child: Text(
              'Select Size',
              style: TextStyle(
                color: AppTheme.dark,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 48,
            child: ListView.builder(
              itemCount: size.length,
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (k != index) {
                      setState(() {
                        k = index;
                      });
                    }
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: k == index ? AppTheme.blue : AppTheme.light,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        size[index],
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: AppTheme.dark,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
            ),
            child: Text(
              'Select Color',
              style: TextStyle(
                color: AppTheme.dark,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 48,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16),
              itemCount: color.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (y != index) {
                      setState(() {
                        y = index;
                      });
                    }
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: color[index],
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: y == index
                        ? Center(
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          )
                        : Center(),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            child: Text(
              'Specification',
              style: TextStyle(
                color: AppTheme.dark,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              Text(
                'Shown:',
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  height: 1.5,
                  letterSpacing: 0.5,
                  color: AppTheme.dark,
                ),
              ),
              Expanded(child: Container()),
              Text(
                'Laser',
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  height: 1.8,
                  letterSpacing: 0.5,
                  color: AppTheme.grey,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(width: 16),
            ],
          ),
          Row(
            children: [
              // SizedBox(width: 16),
              Expanded(child: Container()),
              Expanded(
                child: Text(
                  'Blue/Anthracite/Watermelon/White',
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 12,
                    height: 1.8,
                    letterSpacing: 0.5,
                    color: AppTheme.grey,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 16),
              Text(
                'Style:',
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  height: 1.5,
                  letterSpacing: 0.5,
                  color: AppTheme.dark,
                ),
              ),
              Expanded(child: Container()),
              Text(
                'CD0113-400',
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 12,
                  height: 1.8,
                  letterSpacing: 0.5,
                  color: AppTheme.grey,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 24,
            ),
            child: Text(
              'The Nike Air Max 270 React ENG combines a full-length React'
              ' foam midsole with a 270 Max Air unit for unrivaled comfort'
              ' and a striking visual experience.',
              style: TextStyle(
                fontFamily: AppTheme.fontFamily,
                fontSize: 12,
                height: 1.8,
                letterSpacing: 0.5,
                color: AppTheme.grey,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 16),
              Text(
                'Review Product',
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ReviewProduct();
                      },
                    ),
                  );
                },
                child: Text(
                  'See More',
                  style: TextStyle(
                    color: AppTheme.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16),
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
              SizedBox(width: 8),
              Text(
                '4.5',
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  height: 1.5,
                  letterSpacing: 0.5,
                  color: AppTheme.grey,
                ),
              ),
              SizedBox(width: 4),
              Text(
                '(5 Reviews)',
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
          Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Image.asset(widget.rev.pfp),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.rev.name,
                          style: TextStyle(
                            color: AppTheme.dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 16,
                          child: widget.rev.star == 5
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
                              : widget.rev.star == 4
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
                                  : widget.rev.star == 3
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
                                      : widget.rev.star == 2
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
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  widget.rev.text,
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 12,
                    height: 1.8,
                    letterSpacing: 0.5,
                    color: AppTheme.grey,
                  ),
                ),
                widget.rev.img.length > 0
                    ? Container(
                  height: 72,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                    itemCount: widget.rev.img.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 72,
                        width: 72,
                        margin: EdgeInsets.only(right: 16),
                        child: Image.asset(widget.rev.img[i]),
                      );
                    },
                  ),
                )
                    : Container(
                  height: 16,
                ),
                Text(
                  widget.rev.date,
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
          ),
          Row(
            children: [
              SizedBox(width: 16),
              Text(
                'You Might Also Like',
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            height: 240,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16),
              itemCount: rec.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 238,
                    width: 141,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.light),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          rec[index].image,
                          height: 109,
                          width: 109,
                        ),
                        SizedBox(height: 8),
                        Text(
                          rec[index].name,
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
                        SizedBox(height: 8),
                        Text(
                          '\$' +
                              (rec[index].price * (100 - rec[index].sale) / 100)
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
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$' + rec[index].price.toString(),
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
                              rec[index].sale.toString() + '% Off',
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
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
                "Add To Card",
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
        ],
      ),
    );
  }
}
