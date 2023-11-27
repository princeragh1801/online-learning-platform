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
              width: 15.w,
              height: 12.h,
              child: Image.asset("assets/icons/menu.png"),
            ),
            GestureDetector(
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/person.png"))),
              ),
            )
          ]),
    ),
  );
}

// reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        
        height: 40.h,
        width: 280.w,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourElementText
          )
        ),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            height: 16.w,
            width: 16.w,
            child: Image.asset('assets/icons/search.png'),
          ),
          SizedBox(
            width: 240.w,
            height: 40.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              obscureText: false,
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                hintText: "Search your course",
                hintStyle: TextStyle(color: AppColors.primaryThreeElementText),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
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
        ]),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.w)),
            color: AppColors.primaryElement,
            border: Border.all(
              color: AppColors.primaryElement
            )
          ),
          child: Image.asset('assets/icons/options.png'),
          )
        )
    ],
  );
}
