import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pixel_mall_flutter_task/custom/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';

import 'components/payment_list_tile.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

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
                          'Finance',
                          style: TextStyle(
                            fontSize: 27.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/card.svg',
                            height: 24.h,
                            width: 24.w,
                          ),
                          SizedBox(width: 16.w),
                          Icon(
                            Icons.add_rounded,
                            size: 32.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 44.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.1, 9],
                              colors: [
                                Color(0xFF266ED7),
                                Color(0xFF4D8AEB),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text('Week',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 44.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: const Color(0xFF171930),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: const Color(0xFF303146)
                                        .withOpacity(0.15)),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text('Month',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 44.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: const Color(0xFF171930),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: const Color(0xFF303146)
                                        .withOpacity(0.15)),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text('Year',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: double.infinity,
                    child: CircularPercentIndicator(
                      linearGradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF654EA3),
                          Color(0xFFEAAFC8),
                        ],
                      ),
                      backgroundColor: const Color(0xFFE9EAED),
                      startAngle: 180.0,
                      radius: 120.r,
                      lineWidth: 13.0,
                      animation: true,
                      percent: 0.7,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$500.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23.sp),
                          ),
                          Text(
                            'Amount spent this week',
                            style: TextStyle(
                                color: const Color(0xFF171930).withOpacity(0.6),
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                      footer: Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 6.h,
                              width: 6.w,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF654EA3),
                                    Color(0xFFEAAFC8),
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              'Amet lorem',
                              style: TextStyle(
                                  color:
                                      const Color(0xFF171930).withOpacity(0.6),
                                  fontSize: 10.sp),
                            ),
                            SizedBox(width: 20.w),
                            CircleAvatar(
                              radius: 3.r,
                              backgroundColor: const Color(0xFFE9EAED),
                            ),
                            Text(
                              'Sit met',
                              style: TextStyle(
                                  color:
                                      const Color(0xFF171930).withOpacity(0.6),
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Today',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      PaymentListTile(
                        isFirstInList: true,
                        payment: Payment(
                          paidToName: 'Nike Store',
                          paidToImagePath: 'assets/images/nike.png',
                          wayOfPayment: 'Master Card',
                          amount: '130.00',
                          time: '10:20 AM',
                        ),
                      ),
                      PaymentListTile(
                        payment: Payment(
                          paidToName: 'Apple Store',
                          paidToImagePath: 'assets/images/apple-gradient.png',
                          wayOfPayment: 'Master Card',
                          amount: '70.00',
                          time: '11:15 AM',
                        ),
                      ),
                      PaymentListTile(
                        payment: Payment(
                          paidToName: 'John Doe',
                          paidToImagePath: 'assets/images/unknown-person.png',
                          wayOfPayment: 'Master Card',
                          amount: '210.00',
                          time: '08:30 PM',
                        ),
                      ),
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
