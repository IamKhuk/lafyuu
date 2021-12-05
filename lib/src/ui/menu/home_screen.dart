import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/dialog/bottom_category_dialog.dart';
import 'package:lafyuu/src/model/favourite_product_model.dart';
import 'package:lafyuu/src/model/recomendation_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';
import 'package:lafyuu/src/ui/details/favourite_product.dart';
import 'package:lafyuu/src/ui/details/offer_screen.dart';
import 'package:lafyuu/src/ui/notifications/notification_screen.dart';
import 'package:lafyuu/src/widgets/item_product.dart';
import 'package:lafyuu/src/widgets/star_widget.dart';

String timerSecText = "";
String timerMinText = "";
String timerHourText = "";

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(minutes: promoTime[_selectedIndex] * 60));
    _controller.forward();
    super.initState();
  }

  var openEndDrawer = GlobalKey<ScaffoldState>();

  TextEditingController searchController = new TextEditingController();

  List<String> promoImg = [
    'assets/images/promotion_image_01.png',
    'assets/images/recommended_product_01.png',
    'assets/images/promotion_image_01.png',
    'assets/images/recommended_product_01.png',
    'assets/images/promotion_image_01.png',
  ];
  List<int> promoTime = [
    8,
    9,
    7,
    13,
    17,
  ];

  List ctg = [
    'assets/icons/shirt.svg',
    'assets/icons/tshirt.svg',
    'assets/icons/man_shoes.svg',
    'assets/icons/man_bag.svg',
    'assets/icons/man_underwear.svg',
    'assets/icons/dress.svg',
    'assets/icons/bikini.svg',
    'assets/icons/skirt.svg',
    'assets/icons/woman_bag.svg',
    'assets/icons/woman_pants.svg',
    'assets/icons/woman_shoes.svg',
    'assets/icons/woman_tshirt.svg',
  ];

  List<String> ctgName = [
    'Man Shirt',
    'Man Tshirt',
    'Man Shoes',
    'Man Bag',
    'Man Underwear',
    'Dress',
    'Bikini',
    'Skirt',
    'Woman Bag',
    'Woman Pants',
    'Woman Shoes',
    'Woman Tshirt',
  ];

  List<RecommendationModel> fleshSale = [
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

  List<RecommendationModel> megaSale = [
    RecommendationModel('assets/images/product_image_01.png',
        'Nike Air Max 270 React ENG', 310.5, 21),
    RecommendationModel('assets/images/product_image_04.png',
        'FS - Nike Air Max 270 React', 435.45, 33),
    RecommendationModel('assets/images/product_image_02.png',
        'FS - Nike Air Max 270 React', 299.43, 24),
    RecommendationModel('assets/images/product_image_03.png',
        'Nike Air Zoom Pegasus 36 Miami', 190.75, 19),
    RecommendationModel('assets/images/product_image_02.png',
        'FS - Nike Air Max 270 React', 299.43, 24),
    RecommendationModel('assets/images/product_image_05.png',
        'Nike Air Max 270 React ENG', 128.25, 15),
    RecommendationModel('assets/images/product_image_06.png',
        'FS - Nike Air Max 270 React', 299.43, 24),
    RecommendationModel('assets/images/product_image_05.png',
        'Nike Air Max 270 React ENG', 128.25, 15),
  ];

  List<FavouriteModel> fav = [
    FavouriteModel('assets/images/fav_product_01.png',
        'Nike Air Max 270 React ENG', 4, 534.33, 24),
    FavouriteModel('assets/images/fav_product_02.png',
        'Nike Air Max 270 React ENG', 5, 472.75, 25),
    FavouriteModel('assets/images/fav_product_03.png',
        'Nike Air Max 270 React ENG', 4, 390.5, 18),
    FavouriteModel('assets/images/fav_product_04.png',
        'Nike Air Max 270 React ENG', 5, 445.25, 15),
    FavouriteModel('assets/images/fav_product_04.png',
        'Nike Air Max 270 React ENG', 5, 445.25, 15),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: openEndDrawer,
      backgroundColor: AppTheme.white,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        color: AppTheme.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Container(
              height: 78,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16, right: 16),
              margin: EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: AppTheme.white,
                border: Border(bottom: BorderSide(color: AppTheme.light)),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: searchController,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search Product',
                        hintStyle: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.8,
                          letterSpacing: 0.5,
                          color: AppTheme.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: searchController.clear,
                          icon: Icon(
                            Icons.clear,
                            size: 16,
                            color: AppTheme.grey,
                          ),
                        ),
                        isDense: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: AppTheme.light),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppTheme.blue,
                          size: 16,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FavouriteProduct();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/love.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NotificationScreen();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/notification.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 0, top: 0),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  Container(
                    height: 206,
                    width: MediaQuery.of(context).size.width - 32,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              _selectedIndex = index;
                            },
                          );
                        },
                        autoPlay: true,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: promoImg.map(
                        (item) {
                          return Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  item,
                                  width: MediaQuery.of(context).size.width - 32,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OfferProduct();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 206,
                                  width: MediaQuery.of(context).size.width - 32,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 20,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    bottom: 16,
                                    top: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      CountSecDown(
                                        animation: StepTween(
                                          begin:
                                              promoTime[_selectedIndex] * 3600,
                                          end: 0,
                                        ).animate(_controller),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    width: MediaQuery.of(context).size.width,
                    height: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: promoImg.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              _controller.animateTo(entry.key.toDouble()),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectedIndex == entry.key
                                  ? AppTheme.blue
                                  : AppTheme.light,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Category',
                          style: TextStyle(
                            color: AppTheme.dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BottomCategoryDialog.showCategoryUI(context);
                        },
                        child: Text(
                          'More Category',
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
                  Container(
                    margin: EdgeInsets.only(
                      top: 12,
                      bottom: 24,
                    ),
                    height: 108,
                    child: ListView.builder(
                      itemCount: ctg.length,
                      padding: EdgeInsets.only(left: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48),
                                  border: Border.all(
                                    color: AppTheme.light,
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(ctg[index]),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 30,
                                width: 70,
                                child: Text(
                                  ctgName[index],
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5,
                                    letterSpacing: 0.5,
                                    color: AppTheme.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Text(
                        'Flash Sale',
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
                                return FavouriteProduct();
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
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 240,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 16),
                      itemCount: fleshSale.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemProduct(
                          data: fleshSale[index],
                          width: 141,
                          height: 240,
                          margin: EdgeInsets.only(right: 16),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Text(
                        'Mega Sale',
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
                                return OfferProduct();
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
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 240,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 16),
                      itemCount: fleshSale.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemProduct(
                          data: fleshSale[index],
                          width: 141,
                          height: 240,
                          margin: EdgeInsets.only(right: 16),
                        );
                      },
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 196,
                        margin: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width - 32,
                        child: Image.asset(
                            'assets/images/recommended_product_01.png'),
                      ),
                      Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width - 32,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 48,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Recommended\nProduct',
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
                            Text(
                              'We recommend the best for you',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.8,
                                letterSpacing: 0.5,
                                color: AppTheme.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: (fav.length + 1) ~/ 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                        left: 16, top: 4, right: 16, bottom: 16),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 44) / 2,
                              margin: EdgeInsets.only(top: 12),
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
                                      fav[index * 2].image,
                                      height: 133,
                                      width: 133,
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
                                    StarWidget(
                                      star: fav[index * 2].star,
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
                                        Text(
                                          '\$' +
                                              fav[index * 2].price.toString(),
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
                                          fav[index * 2].sale.toString() +
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          index * 2 + 1 >= fav.length
                              ? Container()
                              : GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12),
                                    width: (MediaQuery.of(context).size.width -
                                            44) /
                                        2,
                                    height: 289,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppTheme.light),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          StarWidget(
                                              star: fav[index * 2 + 1].star),
                                          SizedBox(height: 16),
                                          Text(
                                            '\$' +
                                                (fav[index * 2 + 1].price *
                                                        (100 -
                                                            fav[index * 2 + 1]
                                                                .sale) /
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
                                              Text(
                                                '\$' +
                                                    fav[index * 2 + 1]
                                                        .price
                                                        .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                fav[index * 2 + 1]
                                                        .sale
                                                        .toString() +
                                                    '% Off',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
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
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountSecDown extends AnimatedWidget {
  CountSecDown({required this.animation}) : super(listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    timerSecText =
        '${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    timerMinText =
        '${(clockTimer.inMinutes.remainder(60) % 60).toString().padLeft(2, '0')}';

    timerHourText =
        '${(clockTimer.inHours.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Container(
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
                '$timerHourText',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
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
                '$timerMinText',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
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
                '$timerSecText',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: AppTheme.dark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
