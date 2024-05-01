import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:luvit/data_layer/static/svg_string_assets.dart';
import 'package:luvit/presentation_layer/home/home_screen.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Badge to show star and scores ex on the the app bar of [HomeScreen]
class StarWithScoreBadge extends StatelessWidget {
  ///Default constructor for [StarWithScoreBadge]
  const StarWithScoreBadge({
    required this.score,
    required this.showFilledStar,
    super.key,
  });

  ///Score to show
  final int score;

  ///Show star filled or empty
  final bool showFilledStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: themeService.state.primaryBorderColor,
        ),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        color: themeService.state.homeScreenBackground,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 2.5.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.string(
            showFilledStar
                ? SvgStringAssets.profileScreenFilledStarIcon
                : SvgStringAssets.profileScreenEmptyStarIcon,
          ),
          Text(
            ' ${formatNumber()}',
            style: TextStyle(
              color: themeService.state.primaryTextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }

  ///Show comma separated number
  String formatNumber() {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 0,
    );
    return formatter.format(score);
  }
}
