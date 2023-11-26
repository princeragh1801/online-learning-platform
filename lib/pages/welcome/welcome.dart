import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_event.dart';

import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                            1,
                            context,
                            'First see things',
                            'Forget about a for of paper all knowledge in one learning',
                            'next',
                            'assets/images/reading.png'),
                        _page(
                            2,
                            context,
                            'Connect With Everyone',
                            "Always keep in touch with your tutor & freind. Let's get connect ",
                            'next',
                            'assets/images/boy.png'),
                        _page(
                            3,
                            context,
                            'Always Fascinated Learning',
                            'Anywhere, anytime. The time is at our disgration so study whenever you want',
                            'get started',
                            'assets/images/man.png'),
                      ]),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page,
                        mainAxisAlignment: MainAxisAlignment.center,
                        dotsCount: 3,
                        decorator: const DotsDecorator(
                            color: Colors.grey,
                            size: Size.square(8),
                            activeSize: Size(18, 8),
                            activeColor: Colors.blue,
                            activeShape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String title, String subtitle,
      String buttonName, String imagePath) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryText),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          // margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primarySecondaryElementText),
          ),
        ),
        GestureDetector(
          onTap: () {
            // index is from 0-2
            if (index < 3) {
              // animations
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              // jump to a new page
              // this is the first time we enter to the app
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);

              print('The value is ${Global.storageService.getDeviceFirstOpen()}');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
              margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
              width: 325.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                color: AppColors.primaryElement,
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.primaryFourElementText,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 10))
                ],
              ),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryElementText),
                ),
              )),
        ),
      ],
    );
  }
}
