import 'package:flutter/cupertino.dart';
import 'package:lafyuu/src/model/recomendation_model.dart';
import 'package:lafyuu/src/theme/app_theme.dart';

class ItemProduct extends StatelessWidget {
  final RecommendationModel data;
  final double width;
  final double height;
  final EdgeInsets margin;

  ItemProduct({
    required this.data,
    required this.width,
    required this.height,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(16),
        height: height,
        width: width,

        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.light),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              data.image,
              height: 109,
              width: 109,
            ),
            SizedBox(height: 8),
            Text(
              data.name,
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
              '\$' + (data.price * (100 - data.sale) / 100).toString(),
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
                  '\$' + data.price.toString(),
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
                  data.sale.toString() + '% Off',
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
  }
}
