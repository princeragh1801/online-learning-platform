import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w, top: 10.h),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 18.w,
              height: 12.h,
              child: Image.asset("assets/icons/menu.png"),
            ),
            Text(
              "Profile",
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset("assets/icons/more-vertical.png"),
            ),
          ]),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: const DecorationImage(
            image: AssetImage("assets/icons/headpic.png"))),
    child: Image(
      image: const AssetImage('assets/icons/edit_3.png'),
      width: 25.w,
      height: 25.h,
    ),
  );
}
