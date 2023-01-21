import 'package:ariam_handcraft/shared/cubit/screens/screens_cubit.dart';
import 'package:ariam_handcraft/shared/cubit/screens/screens_state.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/prodcuts_model.dart';
import '../../../shared/style/colors.dart';
import '../../../shared/style/widgets/border_container.dart';


class Crochet extends StatelessWidget {
  const Crochet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ScreensCubit, ScreensState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        ScreensCubit cubit = ScreensCubit.get(context);
        return Scaffold(
          // body: FutureBuilder(
          //   future:  cubit.filterCategory(categoryName: "Crochet"),
          //   builder: (context, snapshot){
          //     return ListView.separated(itemBuilder: (context,index){
          //       return productsCard(height, width, model: snapshot.data[index]);
          //     }, separatorBuilder:(context,index){
          //       return SizedBox(height:height*.01,);
          //     } , itemCount: 10)
          //   }
          // )
        );
      },
    );
  }
  Widget productsCard(height, width, {required ProductModel model}) {
    return Stack(
      children: [
        Container(
          height: height * .5,
          width: width * 0.6,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            color: gery,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            //make border radius more than 50% of square height & width
            child: Image.asset(
              model.img!,
              height: height * 0.3,
              width: width * 0.4,
              fit: BoxFit.cover, //change image fill type
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: borderContainer(
            bottomLeft: 25,
            topRight: 25,
            containerColor: black.withOpacity(.7),
            widget: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                      text: model.categoryId!,
                      color: white,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: appText(
                            text: "${model.price!.toString()} LE",
                            color: model.isDiscount != true ? white : red,
                            needLine: model.isDiscount == true ? true : false,
                          ),
                        ),
                        SizedBox(
                          width: width * .03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: model.isDiscount == true
                              ? appText(
                            text:
                            "${model.price! - (model.price! * model.discount! / 100)} LE"
                                .toString(),
                            color: white,
                          )
                              : null,
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: model.isDiscount != false
              ? borderContainer(
            topRight: 25,
            bottomLeft: 25,
            containerColor: red,
            widget: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    appText(
                        text: "Special Offer", color: white, maxLine: 2),
                    appText(
                        text: "${model.discount} %",
                        color: white,
                        maxLine: 2),
                  ],
                )),
          )
              : const Center(),
        ),
      ],
    );
  }
}
