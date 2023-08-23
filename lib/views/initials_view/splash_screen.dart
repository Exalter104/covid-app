// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/utils/assets/app_images.dart';
import 'dart:math' as math;

import 'package:my_flutter_boilerplate/utils/utils.dart';
import 'package:my_flutter_boilerplate/view_model/controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
// ................Animation Controller.........................................
  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 2), () => Get.to(RoutesName.homeScreen));
    splashScreenController.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    double responsiveWidth = MediaQuery.of(context).size.width;
    double responsiveHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: SizedBox(
                height: responsiveHeight * .3,
                width: responsiveWidth * 0.4,
                child: Center(
                  child: Image.asset(
                    AppImages.splashScreenLogo,
                    height: responsiveHeight * 0.7,
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          // SizedBox(height: responsiveHeight * .002),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Covid-19\n Tracker App ",
              textAlign: TextAlign.center,
              style: SafeGoogleFont("Monsterrate",
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
