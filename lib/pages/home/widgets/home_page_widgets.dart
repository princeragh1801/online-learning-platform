import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_state.dart';

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
            border: Border.all(color: AppColors.primaryFourElementText)),
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
              decoration: const InputDecoration(
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
            border: Border.all(color: AppColors.primaryElement)),
        child: Image.asset('assets/icons/options.png'),
      ))
    ],
  );
}

// slider view

Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
          height: 160.h,
          width: 325.w,
          margin: EdgeInsets.only(top: 20.h),
          child: PageView(
            onPageChanged: (value) {
              context.read<HomePageBlocs>().add(HomePageDots(value));
            },
            children: [
              _sliderContainer('assets/icons/art.png'),
              _sliderContainer('assets/icons/Image(1).png'),
              _sliderContainer('assets/icons/Image(2).png'),
            ],
          )),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: const DotsDecorator(
              color: AppColors.primaryThreeElementText,
              size: Size.square(5),
              activeSize: Size(17, 5),
              activeColor: AppColors.primaryElement,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
      )
    ],
  );
}

Widget _sliderContainer(String imagePath) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
            image: AssetImage(
              imagePath,
            ),
            fit: BoxFit.fill)),
  );
}

// menu text
Widget menuText() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText("Choose your course",
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
            _reusableText("See all")
          ],
        ),
        Row(children: [
          _menuTextItem("All", color: AppColors.primaryElement),
          _menuTextItem(
            "Popular",
          ),
          _menuTextItem(
            "Newest",
          ),
        ]),
      ],
    ),
  );
}

Widget _reusableText(String text,
    {FontWeight fontWeight = FontWeight.normal,
    int fontSize = 12,
    Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Widget _menuTextItem(String text, {Color color = Colors.white}) {
  return Container(
      margin: EdgeInsets.only(top: 5.h, right: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primaryFourElementText),
          color: color,
          borderRadius: BorderRadius.circular(12.w)),
      child: _reusableText(
        text,
      ));
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(12.w)),
        image: const DecorationImage(
            image: AssetImage('assets/icons/image(4).png'), fit: BoxFit.cover)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end, 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        "Best course for IT",
        overflow: TextOverflow.fade,
        maxLines: 1,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 11.sp,
          color: AppColors.primaryElementText,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "Flutter best course",
        overflow: TextOverflow.fade,
        maxLines: 1,
        textAlign: TextAlign.left,
        softWrap: false,
        style: TextStyle(
          fontSize: 8.sp,
          color: AppColors.primaryFourElementText,
          fontWeight: FontWeight.normal,
        ),
      )
    ]),
  );
}
