import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_mall_flutter_task/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'custom/custom_bottom_navbar.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BottomNavbarIndexProvider>(
      create: (context) => BottomNavbarIndexProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Organize Pro',
          theme: ThemeData(
            primarySwatch: const MaterialColor(
              0xFF171930,
              <int, Color>{
                50: Color(0xFF171930),
                100: Color(0xFF171930),
                200: Color(0xFF171930),
                300: Color(0xFF171930),
                400: Color(0xFF171930),
                500: Color(0xFF171930),
                600: Color(0xFF171930),
                700: Color(0xFF171930),
                800: Color(0xFF171930),
                900: Color(0xFF171930),
              },
            ),
            textTheme: Typography.englishLike2018.apply(
              fontSizeFactor: 1.sp,
              bodyColor: const Color(0xFF171930),
              fontFamily: 'Inter',
            ),
          ),
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}
