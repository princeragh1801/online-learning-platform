
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/pages.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/bloc_providers.dart';



Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          // title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const ApplicationPage(),

          // this is the one method for routing
          // routes: {
          //   "signIn": (context) => const SignIn(),
          //   "register":(context) => const Register(),
          //   "applicationPage":(context) => const ApplicationPage(),
          // },

          // we want to separate routes so we have to generate them
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
