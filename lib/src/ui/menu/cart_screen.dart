import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/src/dialog/center_dialog.dart';
import 'package:lafyuu/src/model/cart_product_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartScreen();
  }
}

class _CartScreen extends State<CartScreen> {
  double price = 0.0;
  int shipping = 40;
  int import = 128;

  List<CartProductModel> cart = [
    CartProductModel(
      'assets/images/cart_product_image_01.png',
      "Nike Air Zoom Pegasus 36 Miami",
      299.43,
      1,
      'assets/icons/love.svg',
      'assets/icons/onlove.svg',
      false,
    ),
    CartProductModel(
      'assets/images/cart_product_image_02.png',
      "Nike Air Max 270 React ENG",
      312.75,
      1,
      'assets/icons/love.svg',
      'assets/icons/onlove.svg',
      false,
    ),
    CartProductModel(
      'assets/images/cart_product_image_03.png',
      "Nike Air Vapormax 360",
      275.33,
      1,
      'assets/icons/love.svg',
      'assets/icons/onlove.svg',
      false,
    ),
  ];

  TextEditingController couponController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    price = 0.0;
    for (int i = 0; i < cart.length; i++) {
      price += (cart[i].price * cart[i].number);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppTheme.white,
        centerTitle: false,
        title: Text(
          'Your Cart',
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
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(bottom: 0, top: 0),
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cart.length,
                  padding: EdgeInsets.only(
                      top: 0, left: 16, right: 16, bottom: 0),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 104,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppTheme.light),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            cart[index].img,
                            height: 72,
                            width: 72,
                          ),
                          SizedBox(width: 12),
                          Container(
                            height: 72,
                            width:
                            MediaQuery.of(context).size.width - 150,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        cart[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          height: 1.5,
                                          letterSpacing: 0.5,
                                          color: AppTheme.dark,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cart[index].onLike =
                                              !cart[index].onLike;
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            cart[index].onLike == false
                                                ? cart[index].onLove
                                                : cart[index].onTapped,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {
                                            CenterDialog
                                                .showErrorFunction(
                                              context,
                                              'Are you sure you want to delete?',
                                                  () {
                                                setState(
                                                      () {
                                                    cart.removeAt(index);
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
                                Expanded(child: Container()),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '\$' +
                                            cart[index].price.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          fontFamily: AppTheme.fontFamily,
                                          color: AppTheme.blue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 24,
                                      width: 106,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppTheme.light),
                                        borderRadius:
                                        BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(
                                                    () {
                                                  cart[index].number > 1
                                                      ? cart[index]
                                                      .number--
                                                      : cart[index]
                                                      .number = 1;
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 24,
                                              width: 32,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    'assets/icons/minus.svg'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 24,
                                            width: 40,
                                            color: AppTheme.light,
                                            child: Center(
                                              child: Text(
                                                cart[index]
                                                    .number
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                  height: 1.5,
                                                  fontFamily:
                                                  AppTheme.fontFamily,
                                                  color: AppTheme.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(
                                                    () {
                                                  cart[index].number++;
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 24,
                                              width: 32,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    'assets/icons/plus.svg'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width - 32,
                height: 56,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                      width:
                      (MediaQuery.of(context).size.width - 32) * 0.73,
                      child: TextField(
                        controller: couponController,
                        autofocus: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Coupon Code',
                          hintStyle: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: AppTheme.light),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.blue),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                            color: AppTheme.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            )),
                        width: (MediaQuery.of(context).size.width - 32) *
                            0.27,
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.8,
                              letterSpacing: 0.5,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 167,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppTheme.light),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Items (3)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '\$' + price.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Shipping',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '\$' + shipping.toString() + '.00',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Import charges',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '\$' + import.toString() + '.00',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.8,
                            letterSpacing: 0.5,
                            color: AppTheme.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 1,
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 8,
                            color: AppTheme.light,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.dark,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '\$' + (price + shipping + import).toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                height: 57,
                decoration: BoxDecoration(
                  color: AppTheme.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 10.0),
                      blurRadius: 30.0,
                      spreadRadius: 0.0,
                      color: AppTheme.blue.withOpacity(0.24),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Check Out',
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
        ),
      ),
    );
  }
}
