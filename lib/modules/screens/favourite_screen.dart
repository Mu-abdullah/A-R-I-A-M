import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/screens/screens_cubit.dart';
import '../../shared/cubit/screens/screens_state.dart';
import '../../shared/style/colors.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ScreensCubit, ScreensState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'No Favourite items',
                  textStyle: TextStyle(
                    color: blueBlack,
                    fontSize: 24,
                  ),
                  speed: const Duration(
                      milliseconds: 100),
                ),
              ],
              repeatForever: false,
              totalRepeatCount: 1,
            ),
          ),
        );
      },
    );
  }
}
