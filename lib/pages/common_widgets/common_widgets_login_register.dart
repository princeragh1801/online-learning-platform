import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar(String title) {
  return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          // height defines the thickness of the line
          height: 1.0,
          color: AppColors.primarySecondaryBackground,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      )
      );
}



Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.primaryFourElementText,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildTextField(String text, String textType, String iconName, void Function(String)? function) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryBg, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset('assets/icons/$iconName.png'),
          ),
          SizedBox(
            width: 270.w,
            height: 50.w,
            child: TextField(
              onChanged: (value) => function!(value),
              keyboardType: TextInputType.multiline,
              obscureText: textType == 'password' ? true : false,
              decoration: InputDecoration(
                hintText: text,
                hintStyle: const TextStyle(color: AppColors.primaryThreeElementText),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ));
}

Widget buildLoginAndRegButton(String buttonName, String buttonType, void Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 375.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: buttonType == 'login' ? AppColors.primaryElement : AppColors.primarySecondaryBackground,
          border: Border.all(
            color: buttonType == 'login' ? Colors.transparent : AppColors.primaryText,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 1,
              spreadRadius: 2,
              offset: const Offset(0, 1),
            )
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: buttonType == 'login' ? AppColors.primaryElementText : AppColors.primaryText),
      )),
    ),
  );
}

