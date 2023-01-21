import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../shared/component/routes_strings.dart';
import '../shared/cubit/screens/screens_cubit.dart';
import '../shared/cubit/screens/screens_state.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../shared/style/colors.dart';
import '../shared/style/image_strings.dart';
import '../shared/style/widgets/border_container.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen({Key? key}) : super(key: key);
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ScreensCubit, ScreensState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ScreensCubit cubit = ScreensCubit.get(context);
        return SafeArea(
            child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
               cubit.getData();
            },
          ),
          appBar: AppBar(
            title: Row(
              children: [
                InkWell(
                    onLongPress: () {
                      Navigator.pushNamed(context, adminSign);
                    },
                    child: appText(text: appName, size: 48)),
                Spacer(),
                Center(
                    child: cubit.currentIndex == 0
                        ? InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, profileScreen);
                            },
                            child: Icon(
                              Iconsax.profile_circle,
                              color: blueBlack,
                              size: 48,
                            ),
                          )
                        : Image.asset(
                            imageLogo,
                            height: height * .06,
                          ))
              ],
            ),
            elevation: 10,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: SalomonBottomBar(
            items: cubit.items,
            onTap: cubit.changeBarItem,
            currentIndex: cubit.currentIndex,
            selectedItemColor: blueBlack,
            unselectedItemColor: black,
          ),
        ));
      },
    );
  }
}
