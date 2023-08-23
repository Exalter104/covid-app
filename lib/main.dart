import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/utils/localization/localization.dart';
import 'package:my_flutter_boilerplate/views/initials_view/splash_screen.dart';

import 'utils/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Languages(),
        locale: const Locale(
            'en', 'US'), // translations will be displayed in that locale
        fallbackLocale: const Locale('en', 'UK'),
        title: 'Exarth Wallpaper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        getPages: AppRoutes.appRoutes(),
        home: const SplashScreen());
  }
}
