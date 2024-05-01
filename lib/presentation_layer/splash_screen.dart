import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/data_layer/models/route_details.dart';
import 'package:luvit/presentation_layer/home/home_screen.dart';
import 'package:luvit/service_layer/service_locator.dart';

///Initial app screen
class SplashScreen extends StatefulWidget {
  ///[SplashScreen] default constructor
  const SplashScreen({super.key});

  ///[SplashScreen] route
  static final RouteDetails route =
      RouteDetails('splashScreen', '/splashScreen');

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToHome() async {
    Timer(
      const Duration(seconds: 2),
      () => navigationService.pushReplacementScreen(HomeScreen.route),
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeService.state.splashScreenBackground,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Text(
              'Luv It',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeService.state.primaryTextColor,
                fontSize: 30.sp,
              ),
            ),
          ),
          const Spacer(),
          Text(
            '© 2024 LuvIt App. All rights reserved',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: themeService.state.secondaryTextColor,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
