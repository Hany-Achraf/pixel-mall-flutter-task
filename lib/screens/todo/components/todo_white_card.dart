import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoWhiteCard extends StatelessWidget {
  const TodoWhiteCard({
    super.key,
    required this.leadingCircleColor,
    required this.todo,
  });

  final Color leadingCircleColor;
  final String todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r), color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 55.h,
            margin: EdgeInsets.only(right: 8.w),
            child: Icon(
              Icons.circle_outlined,
              size: 16.sp,
              color: leadingCircleColor,
            ),
          ),
          Flexible(
            child: Text(
              todo,
              style: TextStyle(fontSize: 13.sp),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
