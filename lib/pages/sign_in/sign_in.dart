import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_state.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

import '../common_widgets/common_widgets_login_register.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.primaryBackground,
                appBar: buildAppBar('Log In'),
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildThirdPartyLogin(context),
                        Center(
                            child: reusableText(
                                'Or use your email account to log in')),
                        Container(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          margin: EdgeInsets.only(
                            top: 66.h,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableText('Email'),
                                buildTextField(
                                    'Enter your email address', 'email', 'user',
                                    (value) {
                                  context
                                      .read<SignInBloc>()
                                      .add(EmailEvent(value));
                                }),
                                reusableText('Password'),
                                buildTextField(
                                    'Enter your password', 'password', 'lock',
                                    (value) {
                                  context
                                      .read<SignInBloc>()
                                      .add(PasswordEvent(value));
                                }),
                                forgotPassword(),
                                SizedBox(
                                  height: 30.h,
                                ),
                                buildLoginAndRegButton('Login', 'login', () {
                                  SignInController(context: context)
                                      .handleSignIn('email');
                                }),
                                buildLoginAndRegButton('Signup', 'signup', () {
                                  Navigator.of(context).pushNamed("register");
                                }),
                              ]),
                        )
                      ]),
                )),
          ),
        );
      },
    );
  }
}
