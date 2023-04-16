import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../custom/custom_bottom_navbar.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

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
                          'Calender',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_rounded, size: 16.sp),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerLeft,
                      ),
                      Text(
                        DateFormat.yMMMM().format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:
                            Icon(Icons.arrow_forward_ios_rounded, size: 16.sp),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 80.h,
                    child: _getMonthDaysList(),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SfCalendar(
                      view: CalendarView.timelineDay,
                      headerHeight: 0,
                      viewHeaderHeight: 0,
                      viewNavigationMode: ViewNavigationMode.none,
                      timeSlotViewSettings: TimeSlotViewSettings(
                        // timeRulerSize: 0,
                        // timeIntervalWidth: 60.w,
                        timeIntervalWidth:
                            MediaQuery.of(context).size.width * 0.2,
                      ),
                      dataSource: MeetingDataSource(_getDataSource()),
                      appointmentBuilder: (context, details) {
                        if (details.appointments.elementAt(0).id == 0 ||
                            details.appointments.elementAt(0).id == 2 ||
                            details.appointments.elementAt(0).id == 5 ||
                            details.appointments.elementAt(0).id == 9) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFF144ACE),
                                  Color(0xFF6BAEFA),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    details.appointments.elementAt(0).subject ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    details.appointments.elementAt(0).notes ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        if (details.appointments.elementAt(0).id == 4 ||
                            details.appointments.elementAt(0).id == 6) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFA5AFC4),
                                  Color(0xFF6D7B98),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    details.appointments.elementAt(0).subject ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    details.appointments.elementAt(0).notes ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/emptiness.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
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

  ListView _getMonthDaysList() {
    return ListView(scrollDirection: Axis.horizontal, children: [
      InkWell(
        child: Container(
          margin: EdgeInsets.only(right: 16.w),
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: const Color(0xFFE5E8EB),
              width: 0.2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color(0xFF171930).withOpacity(0.6),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tue',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '11',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF654EA3),
              Color(0xFFEAAFC8),
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Wed',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '12',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thu',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '13',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Fri',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '14',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sat',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '15',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sun',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '16',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Mon',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '17',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: const Color(0xFFE5E8EB),
            width: 0.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tue',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF171930).withOpacity(0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '18',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  // Row _getTimelines(BuildContext context) {
  //   return Row(
  //     children: [
  //       Column(
  //         children: [
  //           Text(
  //             '9 AM',
  //             style: TextStyle(
  //               fontSize: 11.sp,
  //               color: const Color(0xFF171930).withOpacity(0.4),
  //             ),
  //           ),
  //           SizedBox(height: 8.h),
  //           Container(
  //             height: 8.h,
  //             width: 8.w,
  //             decoration: BoxDecoration(
  //               color: const Color(0xFF171930).withOpacity(0.4),
  //               shape: BoxShape.circle,
  //             ),
  //           ),
  //           Container(
  //             height: 20.h,
  //             width: 2.w,
  //             decoration: BoxDecoration(
  //               color: const Color(0xFF171930).withOpacity(0.4),
  //             ),
  //           ),
  //         ],
  //       ),
  //       // SizedBox(width: 31.w),
  //       SizedBox(width: MediaQuery.of(context).size.width * 0.123),
  //       Column(
  //         children: [
  //           Text(
  //             '10 AM',
  //             style: TextStyle(
  //               fontSize: 11.sp,
  //               color: const Color(0xFF171930).withOpacity(0.4),
  //             ),
  //           ),
  //           SizedBox(height: 8.h),
  //           Container(
  //             height: 8.h,
  //             width: 8.w,
  //             decoration: BoxDecoration(
  //               color: const Color(0xFF171930).withOpacity(0.4),
  //               shape: BoxShape.circle,
  //             ),
  //           ),
  //           Container(
  //             height: 20.h,
  //             width: 2.w,
  //             decoration: BoxDecoration(
  //               color: const Color(0xFF171930).withOpacity(0.4),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}

List<Appointment> _getDataSource() {
  final List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  DateTime startTime = DateTime(today.year, today.month, today.day, 7, 0, 0);
  DateTime endTime = startTime.add(const Duration(hours: 3));
  meetings.add(Appointment(
    id: 0,
    startTime: startTime,
    endTime: endTime,
    subject: 'Lorem Ipsum',
    notes: 'Sit dolor met ipsum',
  ));

  startTime = DateTime(today.year, today.month, today.day, 10, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 1,
    startTime: startTime,
    endTime: endTime,
  ));

  startTime = DateTime(today.year, today.month, today.day, 12, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 2,
    startTime: startTime,
    endTime: endTime,
    subject: 'Lorem Ipsum',
    notes: 'Sit dolor met ipsum',
  ));

  startTime = DateTime(today.year, today.month, today.day, 7, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 3,
    startTime: startTime,
    endTime: endTime,
  ));

  startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 4,
    startTime: startTime,
    endTime: endTime,
    subject: 'Lorem Ipsum',
    notes: 'Sit dolor met ipsum',
  ));

  startTime = DateTime(today.year, today.month, today.day, 7, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 5,
    startTime: startTime,
    endTime: endTime,
    subject: 'Lorem Ipsum',
    notes: 'Sit dolor met ipsum',
  ));

  startTime = DateTime(today.year, today.month, today.day, 8, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 6,
    startTime: startTime,
    endTime: endTime,
    subject: 'Lorem Ipsum',
    notes: 'Sit dolor met ipsum',
  ));

  startTime = DateTime(today.year, today.month, today.day, 10, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 7,
    startTime: startTime,
    endTime: endTime,
  ));

  startTime = DateTime(today.year, today.month, today.day, 7, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 8,
    startTime: startTime,
    endTime: endTime,
  ));

  startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 9,
    startTime: startTime,
    endTime: endTime,
    subject: 'Lorem Ipsum',
    notes: 'Sit dolor met ipsum',
  ));

  startTime = DateTime(today.year, today.month, today.day, 11, 0, 0);
  endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Appointment(
    id: 10,
    startTime: startTime,
    endTime: endTime,
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
