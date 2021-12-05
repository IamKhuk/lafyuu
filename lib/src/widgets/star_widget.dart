import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class StarWidget extends StatelessWidget {
  final int star;

  StarWidget({required this.star});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      child: star == 5
          ? Row(
              children: [
                SvgPicture.asset('assets/icons/star_12x.svg'),
                SizedBox(width: 2),
                SvgPicture.asset('assets/icons/star_12x.svg'),
                SizedBox(width: 2),
                SvgPicture.asset('assets/icons/star_12x.svg'),
                SizedBox(width: 2),
                SvgPicture.asset('assets/icons/star_12x.svg'),
                SizedBox(width: 2),
                SvgPicture.asset('assets/icons/star_12x.svg'),
              ],
            )
          : star == 4
              ? Row(
                  children: [
                    SvgPicture.asset('assets/icons/star_12x.svg'),
                    SizedBox(width: 2),
                    SvgPicture.asset('assets/icons/star_12x.svg'),
                    SizedBox(width: 2),
                    SvgPicture.asset('assets/icons/star_12x.svg'),
                    SizedBox(width: 2),
                    SvgPicture.asset('assets/icons/star_12x.svg'),
                    SizedBox(width: 2),
                    SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                  ],
                )
              : star == 3
                  ? Row(
                      children: [
                        SvgPicture.asset('assets/icons/star_12x.svg'),
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/icons/star_12x.svg'),
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/icons/star_12x.svg'),
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                      ],
                    )
                  : star == 2
                      ? Row(
                          children: [
                            SvgPicture.asset('assets/icons/star_12x.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                          ],
                        )
                      : Row(
                          children: [
                            SvgPicture.asset('assets/icons/star_12x.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                            SizedBox(width: 2),
                            SvgPicture.asset('assets/icons/star_12x_empty.svg'),
                          ],
                        ),
    );
  }
}
