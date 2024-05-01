import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/business_layer/theme/theme_cubit.dart';
import 'package:luvit/data_layer/models/route_details.dart';
import 'package:luvit/data_layer/static/svg_string_assets.dart';
import 'package:luvit/presentation_layer/common/base_theme_view.dart';
import 'package:luvit/presentation_layer/common/widgets/bottom_navigation_bar_container.dart';
import 'package:luvit/presentation_layer/home/common/star_with_score_badge.dart';
import 'package:luvit/presentation_layer/home/tabs/home_tab/home_tab.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Home screen of the app
class HomeScreen extends StatelessWidget {
  ///Default constructor for [HomeScreen]
  const HomeScreen({super.key});

  ///[RouteDetails]  for [HomeScreen]
  static final RouteDetails route = RouteDetails('homeScreen', '/homeScreen');

  @override
  Widget build(BuildContext context) {
    return BaseThemeView(
      builder: (context, themeState) {
        return Scaffold(
          backgroundColor: themeState.homeScreenBackground,
          appBar: _appBar(themeState),
          body: const HomeTab(),
          bottomNavigationBar: CustomPaint(
            size: Size(1.sw, 90.h),
            painter: BottomNavigationBarContainer(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bottomNavigationChild(
                    SvgStringAssets.bottomNavigationBarHomeIcon,
                    '홈',
                    isSelected: true,
                  ),
                  _bottomNavigationChild(
                    SvgStringAssets.bottomNavigationBarLocationIcon,
                    '스팟',
                  ),
                  SizedBox(
                    height: 65.r,
                    width: 65.r,
                    child: SvgPicture.string(
                      SvgStringAssets.bottomNavigationBarStarIcon,
                    ),
                  ),
                  _bottomNavigationChild(
                    SvgStringAssets.bottomNavigationBarChatIcon,
                    '채팅',
                  ),
                  _bottomNavigationChild(
                    SvgStringAssets.bottomNavigationBarProfileIcon,
                    '마이',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar(ThemeState themeState) {
    return AppBar(
      backgroundColor: themeState.homeScreenBackground,
      leading: SvgPicture.string(
        SvgStringAssets.profileScreenUserLocationIcon,
        height: 20.h,
      ),
      leadingWidth: 28.w,
      titleSpacing: 0,
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            color: themeState.primaryTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
          children: const [
            TextSpan(
              text: '목이길어슬픈기린',
            ),
            TextSpan(
              text: '님의 새로운 ',
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            ),
            TextSpan(
              text: '스팟',
            ),
          ],
        ),
      ),
      actions: [
        const StarWithScoreBadge(
          score: 323233,
          showFilledStar: true,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.string(
                SvgStringAssets.notificationBellIcon,
                height: 18.h,
              ),
              Container(
                height: 5.r,
                width: 5.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeState.notificationPendingColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomNavigationChild(
    String svg,
    String text, {
    bool isSelected = false,
  }) {
    return SizedBox(
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.r,
            width: 30.r,
            child: SvgPicture.string(
              svg,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? themeService.state.userTagBadgeLightTextColor
                  : themeService.state.unselectedTabColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
