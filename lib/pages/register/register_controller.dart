import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    try {
      final state = context.read<RegisterBloc>().state;
      String username = state.username,
          email = state.email,
          password = state.password,
          confirmPassword = state.confirmPassword;

      if (username.isEmpty) {
        toastInfo(message: 'You need to fill username');
      }
      if (email.isEmpty) {
        toastInfo(message: 'You need to fill an email address');
      }
      if (password.isEmpty) {
        toastInfo(message: 'You need to fill password');
      }
      if (confirmPassword.isEmpty) {
        toastInfo(message: 'You need to re-enter the password');
      }
      if (password != confirmPassword) {
        toastInfo(message: 'Passwords not match');
      }

      try {
        final credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        final user = credentials.user;

        if (user == null) {
          toastInfo(message: "Some error occured please try again");
        } else {
          await user.sendEmailVerification();
          await user.updateDisplayName(username);
          toastInfo(
              message:
                  "An email has been send to your registered email. To activate it please check your email and verify it");

          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          toastInfo(message: 'Account already exist with this email');
        } else if (e.code == 'invalid-email') {
          toastInfo(message: 'Check the email address');
        }
      }
    } catch (e) {
      toastInfo(message: e.toString());
    }
  }


}
