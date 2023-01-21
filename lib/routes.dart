import 'package:ariam_handcraft/modules/auth/admin_sign.dart';
import 'package:ariam_handcraft/modules/auth/user_sign.dart';
import 'package:ariam_handcraft/modules/screens/favourite_screen.dart';
import 'package:ariam_handcraft/modules/screens/home_screen.dart';
import 'package:ariam_handcraft/shared/component/routes_strings.dart';
import 'package:ariam_handcraft/shared/cubit/add_products/add_data_cubit.dart';
import 'package:ariam_handcraft/shared/cubit/auth/auth_cubit.dart';
import 'package:ariam_handcraft/shared/cubit/screens/screens_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/admin/add_products.dart';
import 'layouts/bottom_navigation_bar_screen.dart';
import 'modules/admin/admin_home.dart';
import 'modules/auth/check_user.dart';
import 'modules/on_boarding/boarding_screen.dart';
import 'modules/screens/cart_screen.dart';
import 'modules/screens/category.dart';
import 'modules/screens/profile_screen.dart';

class AppRouter {
  Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ScreensCubit(),
                  child: HomeScreen(),
                ));

      case checkUser:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AuthCubit(),
                  child: CheckUser(),
                ));

      case userSign:
        final phone = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AuthCubit(),
            child: UserSign(
              phoneNumber: phone,
            ),
          ),
        );

      case adminSign:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AuthCubit(),
                  child: AdminSign(),
                ));

      case bottomNavigationBar:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ScreensCubit(),
                  child: BottomNavigationBarScreen(),
                ));

      case favourite:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ScreensCubit(),
                  child: FavouriteScreen(),
                ));

      case cart:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ScreensCubit(),
                  child: CartScreen(),
                ));

      case category:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ScreensCubit(),
                  child: CategoryScreen(),
                ));

      case profileScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ScreensCubit(),
                  child: ProfileScreen(),
                ));

      case addDataScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AddDataCubit(),
                  child: AddDataScreen(),
                ));

      case adminHome:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AddDataCubit(),
                  child: AdminHome(),
                ));

      case board:
        return MaterialPageRoute(
          builder: (_) => BoardingScreen(),
        );
    }
  }
}
