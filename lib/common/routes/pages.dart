import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const WelcomePage(),
          bloc: BlocProvider(
            create: (context) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGNIN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (context) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (context) => RegisterBloc(),
          )),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        // bloc: BlocProvider(create: (context) => WelcomeBloc(),)
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      // check for routeName matching when navigator call of
      var result =
          routes().where((element) => element.route == routeSettings.name);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: routeSettings);
      }
    }

    return MaterialPageRoute(
      builder: (context) => const SignIn(),
      settings: routeSettings
    );
  }
}

// unify blocProviders, routes and pages(screens) together
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
