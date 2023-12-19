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
            _reusableText("Profile"),
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

var _buttonInfo = <String, String>{
  "Settings" : "settings.png",
  "Payment Details" : "credit-card.png",
  "Achievements" : "award.png",
  "Love" : "heart(1).png",
  "Remainders" : "cube.png"
};

Widget buildCustomButton() {
  return Column(
    children: [
      ...List.generate(_buttonInfo.length, (index) => Container(
        margin: EdgeInsets.only(left: 30.w),
        child: 
              GestureDetector(
              onTap: () {
                
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      color: AppColors.primaryElement,
                    ),
                    child: Image(image: AssetImage('assets/icons/${_buttonInfo.values.elementAt(index)}')),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  _reusableText(_buttonInfo.keys.elementAt(index))
                ]),
              ),
        ),
      ))
      
    ],
  );
}

Widget _reusableText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp),
  );
}
