import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/bloc/app_event.dart';

import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';
import 'widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              // appBar: AppBar(),
              body: buildPage(context.read<AppBloc>().state.index),
              bottomNavigationBar: Container(
                height: 58.h,
                width: 375.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items: buildTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
