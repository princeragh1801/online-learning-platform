import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../common_widgets/common_widgets_login_register.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar('Sign Up'),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Center(
                        child: reusableText(
                            'Enter your details below & sign up ')),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(
                        top: 60.h,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText('Username'),
                            buildTextField('Enter username', 'username', 'user',
                                (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UsernameEvent(value));
                            }),
                            reusableText('Email'),
                            buildTextField(
                                'Enter your email address', 'email', 'user',
                                (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            }),
                            reusableText('Password'),
                            buildTextField(
                                'Enter your password', 'password', 'lock',
                                (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            }),
                            reusableText('Confirm Password'),
                            buildTextField(
                                'Re-enter your password', 'password', 'lock',
                                (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(ConfirmPasswordEvent(value));
                            }),
                            Container(
                              margin: EdgeInsets.only(top: 25.h),
                              child: reusableText('By creating an account you have to agree with our terms & conditions'),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            buildLoginAndRegButton('Signup', 'login', () {
                              RegisterController(context: context)
                                  .handleEmailRegister();
                            }),
                          ]),
                    )
                  ]),
            )),
      ),
    );
  }
}
