import 'package:flutter/material.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class BottomCategoryDialog {
  static void showCategoryUI(BuildContext context) {
    List<String> ctg = [
      'Man Shirt',
      'Man T-Shirt',
      'Man Shoes',
      'Man Bag',
      'Man UnderWear',
      'Dress',
      'Bikini',
      'Skirt',
      'Woman Bag',
      'Woman Pants',
      'Woman Shoes',
      'Woman T-Shirt',
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    itemCount: ctg.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 54,
                        width: MediaQuery.of(context).size.width - 52,
                        child: Text(
                          ctg[index],
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            letterSpacing: 0.5,
                            color: AppTheme.dark,
                          ),
                        ),
                      );
                    },
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
