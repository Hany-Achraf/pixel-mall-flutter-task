import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_mall_flutter_task/screens/calender/calender_screen.dart';
import 'package:pixel_mall_flutter_task/screens/finance/finance_screen.dart';
import 'package:pixel_mall_flutter_task/screens/todo/todo_screen.dart';
import 'package:provider/provider.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = Provider.of<BottomNavbarIndexProvider>(context).index;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      height: 87.h,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: index == 1
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                ),
                onPressed: () {
                  Provider.of<BottomNavbarIndexProvider>(context, listen: false)
                      .changeIndex(index: 1);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalenderScreen()),
                  );
                },
              ),
              Text(
                'Calendar',
                style: TextStyle(
                  color: index == 1
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.check_circle_rounded,
                  color: index == 2
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                ),
                onPressed: () {
                  Provider.of<BottomNavbarIndexProvider>(context, listen: false)
                      .changeIndex(index: 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TodoScreen()),
                  );
                },
              ),
              Text(
                'ToDo List',
                style: TextStyle(
                  color: index == 2
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: index == 3
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                ),
                onPressed: () {
                  Provider.of<BottomNavbarIndexProvider>(context, listen: false)
                      .changeIndex(index: 3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FinanceScreen()),
                  );
                },
              ),
              Text(
                'Finance',
                style: TextStyle(
                  color: index == 3
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.settings_rounded,
                  color: index == 4
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                ),
                onPressed: () {},
              ),
              Text(
                'Settings',
                style: TextStyle(
                  color: index == 4
                      ? const Color(0xFF171930)
                      : const Color(0xFFBAC2CB),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavbarIndexProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void changeIndex({required int index}) {
    _index = index;
    notifyListeners();
  }
}
