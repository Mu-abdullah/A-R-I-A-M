import 'package:ariam_handcraft/shared/cubit/screens/screens_cubit.dart';
import 'package:ariam_handcraft/shared/cubit/screens/screens_state.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Bouquet extends StatelessWidget {
  const Bouquet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScreensCubit, ScreensState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: appText(text: "Bouquet"),
          ),
        );
      },
    );
  }
}