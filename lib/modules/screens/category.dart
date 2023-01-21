import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/prodcuts_model.dart';
import '../../shared/cubit/screens/screens_cubit.dart';
import '../../shared/cubit/screens/screens_state.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/widgets/border_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
        return DefaultTabController (
          length: 4,
          animationDuration: const Duration(milliseconds: 300),
          child: Scaffold(
             appBar:AppBar(
               bottom:  TabBar(tabs: cubit.topTabs,
                 indicatorPadding:const EdgeInsets.symmetric(horizontal: 10,),
                 isScrollable: true,
               ),
               title: appText(text: "Category",size: 36),
               elevation: 0,
               excludeHeaderSemantics: false,
             ),
            body: TabBarView(
              children: cubit.categoryScreen,
            ),
          ),
        );
      },
    );
  }

}
