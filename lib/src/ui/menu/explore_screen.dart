import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyuu/src/model/woman_fashion_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExploreScreen();
  }
}

class _ExploreScreen extends State<ExploreScreen> {
  var openEndDrawer = GlobalKey<ScaffoldState>();

  TextEditingController searchController = new TextEditingController();

  List<FashionModel> manFashion = [
    FashionModel('assets/icons/shirt.svg', 'Man Shirt'),
    FashionModel('assets/icons/man_bag.svg', 'Man Work Equipment'),
    FashionModel('assets/icons/tshirt.svg', 'Man T-Shirt'),
    FashionModel('assets/icons/man_shoes.svg', 'Man Shoes'),
    FashionModel('assets/icons/man_pants.svg', 'Man Pants'),
    FashionModel('assets/icons/man_underwear.svg', 'Man Underwear'),
  ];

  List<FashionModel> womanFashion = [
    FashionModel('assets/icons/dress.svg', 'Dress'),
    FashionModel('assets/icons/woman_tshirt.svg', 'Woman T-Shirt'),
    FashionModel('assets/icons/woman_pants.svg', 'Woman Pants'),
    FashionModel('assets/icons/skirt.svg', 'Skirt'),
    FashionModel('assets/icons/woman_bag.svg', 'Woman Bag'),
    FashionModel('assets/icons/woman_shoes.svg', 'High Heels'),
    FashionModel('assets/icons/bikini.svg', 'Bikini'),
  ];
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: openEndDrawer,
      backgroundColor: AppTheme.white,
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
                      onChanged: (value) {
                        print(value.length);
                        if (value.length > 2) {
                          setState(() {
                            isSearch = true;
                          });
                        } else {
                          setState(() {
                            isSearch = false;
                          });
                        }
                      },
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
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/love.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      openEndDrawer.currentState!.openEndDrawer();
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
              child: isSearch
                  ? Container()
                  : ListView(
                      padding: EdgeInsets.all(0),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(width: 16),
                            Text(
                              'Man Fashion',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1.8,
                                letterSpacing: 0.5,
                                color: AppTheme.dark,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: (manFashion.length + 4) ~/ 4,
                          padding: EdgeInsets.only(
                              left: 16, top: 0, right: 0, bottom: 24),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: 70,
                                  margin: EdgeInsets.only(
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            border: Border.all(
                                                color: AppTheme.light)),
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              manFashion[index * 4].icon),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 70,
                                        child: Text(
                                          manFashion[index * 4].title,
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontFamily,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                            height: 1.5,
                                            letterSpacing: 0.5,
                                            color: AppTheme.grey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                index * 4 + 1 >= manFashion.length
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(
                                          right: 16,
                                          top: 16,
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    80) /
                                                4,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  border: Border.all(
                                                      color: AppTheme.light)),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    manFashion[index * 4 + 1]
                                                        .icon),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              child: Text(
                                                manFashion[index * 4 + 1].title,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                index * 4 + 2 >= manFashion.length
                                    ? Container()
                                    : Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    80) /
                                                4,
                                        margin: EdgeInsets.only(
                                          right: 16,
                                          top: 16,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  border: Border.all(
                                                      color: AppTheme.light)),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    manFashion[index * 4 + 2]
                                                        .icon),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              child: Text(
                                                manFashion[index * 4 + 2].title,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                index * 4 + 3 >= manFashion.length
                                    ? Container()
                                    : Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    80) /
                                                4,
                                        margin:
                                            EdgeInsets.only(right: 16, top: 16),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  border: Border.all(
                                                      color: AppTheme.light)),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    manFashion[index * 4 + 3]
                                                        .icon),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              child: Text(
                                                manFashion[index * 4 + 3].title,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(width: 16),
                            Text(
                              'Woman Fashion',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1.8,
                                letterSpacing: 0.5,
                                color: AppTheme.dark,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: (womanFashion.length + 4) ~/ 4,
                          padding: EdgeInsets.only(
                              left: 16, top: 0, right: 0, bottom: 24),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: 70,
                                  margin: EdgeInsets.only(
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            border: Border.all(
                                                color: AppTheme.light)),
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              womanFashion[index * 4].icon),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 70,
                                        child: Text(
                                          womanFashion[index * 4].title,
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontFamily,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                            height: 1.5,
                                            letterSpacing: 0.5,
                                            color: AppTheme.grey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                index * 4 + 1 >= womanFashion.length
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(
                                          right: 16,
                                          top: 16,
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    80) /
                                                4,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  border: Border.all(
                                                      color: AppTheme.light)),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    womanFashion[index * 4 + 1]
                                                        .icon),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              child: Text(
                                                womanFashion[index * 4 + 1]
                                                    .title,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                index * 4 + 2 >= womanFashion.length
                                    ? Container()
                                    : Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    80) /
                                                4,
                                        margin: EdgeInsets.only(
                                          right: 16,
                                          top: 16,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  border: Border.all(
                                                      color: AppTheme.light)),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    womanFashion[index * 4 + 2]
                                                        .icon),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              child: Text(
                                                womanFashion[index * 4 + 2]
                                                    .title,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                index * 4 + 3 >= womanFashion.length
                                    ? Container()
                                    : Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    80) /
                                                4,
                                        margin:
                                            EdgeInsets.only(right: 16, top: 16),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  border: Border.all(
                                                      color: AppTheme.light)),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    womanFashion[index * 4 + 3]
                                                        .icon),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 70,
                                              child: Text(
                                                womanFashion[index * 4 + 3]
                                                    .title,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: AppTheme.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
