import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixel_mall_flutter_task/custom/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

import '../calender/calender_screen.dart';
import 'components/todo_gradient_card.dart';
import 'components/todo_white_card.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<BottomNavbarIndexProvider>(context, listen: false)
            .changeIndex(index: 0);
        Navigator.popUntil(
          context,
          (route) => route.isFirst,
        );
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFEFF1F5),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 171.w,
                        ),
                        child: Text(
                          'ToDo',
                          style: TextStyle(
                            fontSize: 27.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.search_rounded, size: 32.sp),
                          SizedBox(width: 16.w),
                          Icon(Icons.add_rounded, size: 32.sp),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 137.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          child: const TodoGradientCard(
                            gradientColor1: Color(0xFF654EA3),
                            gradientColor2: Color(0xFFEAAFC8),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          child: const TodoGradientCard(
                            gradientColor1: Color(0xFFA5AFC4),
                            gradientColor2: Color(0xFF6D7B98),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Column(
                    children: [
                      const TodoWhiteCard(
                          leadingCircleColor: Color(0xFFF18C27),
                          todo: 'Daily meeting with the team'),
                      SizedBox(height: 8.h),
                      const TodoWhiteCard(
                          leadingCircleColor: Color(0xFFF18C27),
                          todo: 'Completing the prototype'),
                      SizedBox(height: 8.h),
                      const TodoWhiteCard(
                          leadingCircleColor: Color(0xFFF18C27),
                          todo: 'Daily meeting with the team'),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Tomorrow',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Column(
                    children: [
                      const TodoWhiteCard(
                          leadingCircleColor: Color(0xFF4886E8),
                          todo: 'Completing the prototype'),
                      SizedBox(height: 8.h),
                      const TodoWhiteCard(
                          leadingCircleColor: Color(0xFF4886E8),
                          todo: 'Daily meeting with the team'),
                      SizedBox(height: 8.h),
                      const TodoWhiteCard(
                          leadingCircleColor: Color(0xFF4886E8),
                          todo: 'Completing the prototype'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavbar(),
      ),
    );
  }
}
