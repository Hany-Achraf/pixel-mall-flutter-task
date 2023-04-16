import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payment {
  final String paidToName;
  final String paidToImagePath;
  final String wayOfPayment;
  final String amount;
  final String time;

  Payment({
    required this.paidToName,
    required this.paidToImagePath,
    required this.wayOfPayment,
    required this.amount,
    required this.time,
  });
}

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({
    super.key,
    required this.payment,
    this.isFirstInList = false,
  });

  final Payment payment;
  final bool isFirstInList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isFirstInList
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28.r,
          backgroundColor: const Color.fromARGB(255, 133, 137, 150),
          foregroundImage: AssetImage(payment.paidToImagePath),
        ),
        title: Text(payment.paidToName, style: TextStyle(fontSize: 13.sp)),
        subtitle: Text(
          payment.wayOfPayment,
          style: TextStyle(
              color: const Color(0xFF171930).withOpacity(0.6), fontSize: 10.sp),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '-\$${payment.amount}',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                ),
                Text(
                  payment.time,
                  style: TextStyle(
                      color: const Color(0xFF171930).withOpacity(0.6),
                      fontSize: 10.sp),
                ),
              ],
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.sp,
              color: const Color(0xFF171930),
            ),
          ],
        ),
      ),
    );
  }
}
