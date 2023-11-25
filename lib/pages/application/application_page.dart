import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: buildPage(_index),
          bottomNavigationBar: Container(
            height: 58.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1
                )
              ]
            ),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              items: [
                _buildNavBarItem('home'),
                _buildNavBarItem('search2'),
                _buildNavBarItem('play-circle1'),
                _buildNavBarItem('message-circle'),
                _buildNavBarItem('person2'),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(String iconName) {
    return BottomNavigationBarItem(
        activeIcon: SizedBox(
          height: 15.w,
          width: 15.h,
          child: Image.asset(
            'assets/icons/$iconName.png',
            color: AppColors.primaryElement,
          ),
        ),
        label: 'Search',
        icon: SizedBox(
          height: 15.w,
          width: 15.w,
          child: Image.asset(
            'assets/icons/$iconName.png',
          ),
        ));
  }
}
