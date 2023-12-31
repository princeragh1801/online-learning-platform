import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class BlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        BlocProvider(
          create: (context) => HomePageBlocs(),
        ),
      ];
}
