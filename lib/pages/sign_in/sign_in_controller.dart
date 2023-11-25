import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // final state = BlocProvider.of<SignInBloc>(context).state; // just another method to access the state

        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email, password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(message: 'You need to fill an email address');
        }
        if (password.isEmpty) {
          //
          toastInfo(message: 'You need to fill an password');
        }
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          final user = credentials.user;
          if (user == null) {
            //
            toastInfo(message: "You don't exist");
          }
          if (user != null) {
            //
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamedAndRemoveUntil("applicationPage", (route)=> false);
            toastInfo(message: "User exist");
          }

          if (!user!.emailVerified) {
            //
            toastInfo(message: "You need to verify your email address");
          } else {
            toastInfo(message: "You're not the user of this app");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: "User not found");
          } else if (e.code == 'wrong-password') {
            toastInfo(message: "You entered wrong password");
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "Check the email");
          }
        }
      }
    } catch (e) {
      toastInfo(message: e.toString());
    }
  }
}
