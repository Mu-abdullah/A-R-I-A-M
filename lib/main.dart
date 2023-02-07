import 'package:ariam_handcraft/routes.dart';
import 'package:ariam_handcraft/shared/component/routes_strings.dart';
import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:ariam_handcraft/shared/cubit/bloc_observer.dart';
import 'package:ariam_handcraft/shared/helper/shared_preferences.dart';
import 'package:ariam_handcraft/shared/style/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


late String initialRoute ;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  if(cashHelperOnBoardingValue != null){
    if(cashHelperUserPhoneValue != null){
      initialRoute = bottomNavigationBar;
    }else{
      initialRoute = checkUser;
    }
  }else{
    initialRoute = board;
  }

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generate,
      theme: lightTheme,
      initialRoute: adminHome,
    );
  }
}

