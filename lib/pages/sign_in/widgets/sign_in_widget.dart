import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';


Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h, left: 35.w, right: 35.w),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _buildIcons('google'),
      _buildIcons('apple'),
      _buildIcons('facebook'),
    ]),
  );
}

Widget _buildIcons(
  String iconName,
) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget forgotPassword(){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      "Forgot Password?",
      style: TextStyle(
        decoration: TextDecoration.underline,
          fontSize: 14.sp,
          color: AppColors.primaryElement,
          fontWeight: FontWeight.normal),
    ),
  );
}