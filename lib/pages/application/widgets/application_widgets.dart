import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/home_page.dart';
import 'package:ulearning_app/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> widgets = const [
    HomePage(),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    ProfilePage()
  ];
  return widgets[index];
}

var buildTabs = [
  _buildNavBarItem('home'),
  _buildNavBarItem('search2'),
  _buildNavBarItem('play-circle1'),
  _buildNavBarItem('message-circle'),
  _buildNavBarItem('person2'),
];

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
