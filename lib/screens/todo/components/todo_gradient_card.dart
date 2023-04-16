import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoGradientCard extends StatelessWidget {
  const TodoGradientCard({
    super.key,
    required this.gradientColor1,
    required this.gradientColor2,
  });

  final Color gradientColor1;
  final Color gradientColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 184.w,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gradientColor1,
            gradientColor2,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_rounded,
                    size: 24.sp, color: Colors.grey[400]),
                padding: const EdgeInsets.all(0),
                alignment: Alignment.topRight,
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 34.h,
                  // height: double.maxFinite,
                  width: 2.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFFC92C),
                        Color(0xFFFD9371),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    'Muster Projekt Beispiel #1',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/clock-filled.svg',
                height: 12.h,
                width: 12.w,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              SizedBox(width: 4.w),
              Text(
                '22.01 (10pm)',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 6.r,
                  // backgroundColor: const Color.fromARGB(255, 133, 137, 150),
                  foregroundImage:
                      const AssetImage('assets/images/blue-tick.png')),
              SizedBox(width: 4.w),
              Text(
                '5 Tasks',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
