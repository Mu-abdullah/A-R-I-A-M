import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../models/category_model.dart';
import '../../models/prodcuts_model.dart';
import '../../shared/component/component.dart';
import '../../shared/component/hard_code.dart';
import '../../shared/cubit/screens/screens_cubit.dart';
import '../../shared/cubit/screens/screens_state.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/image_strings.dart';
import '../../shared/style/widgets/border_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        appText(
                          text:
                              "Hello $userName\n\nWhat you are\nlooking for today?",
                          maxLine: 5,
                          color: fayroozy,
                        ),
                        Spacer(),
                        Image.asset(
                          imageLogo,
                          height: height * .15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Divider(
                    thickness: height * .002,
                    height: height * .02,
                    endIndent: height * .01,
                    indent: height * .2,
                    color: simon,
                  ),
                  ourWork(cubit, height, width),
                  SizedBox(
                    height: height * .02,
                  ),
                  Divider(
                    thickness: height * .002,
                    height: height * .02,
                    endIndent: height * .2,
                    indent: height * .01,
                    color: simon,
                  ),
                  category(height, width),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget category(height, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(text: "Category", size: 36),
        SizedBox(
          height: height * .02,
        ),
        SizedBox(
          height: height * .45,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  categoryCard(height, width, model: testCategory[index]),
              separatorBuilder: (context, index) => SizedBox(
                    width: width * .02,
                  ),
              itemCount: testCategory.length),
        ),
      ],
    );
  }

  Widget ourWork(cubit, height, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(text: "Our Work", size: 36),
        SizedBox(
          height: height * .02,
        ),
        SizedBox(
          height: height * .5,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => productsCard(
                  height, width,
                  model: testProducts[index]),
              separatorBuilder: (context, index) => SizedBox(
                    width: width * .02,
                  ),
              itemCount: testProducts.length),
        ),
      ],
    );
  }

  Widget categoryCard(height, width, {required CategoryModel model}) {
    return Stack(
      children: [
        Container(
          height: height * .45,
          width: width * 0.55,
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
              model.categoryImg!,
              height: height * 0.3,
              width: width * 0.4,
              fit: BoxFit.cover, //change image fill type
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: borderContainer(
            bottomRight: 25,
            topLeft: 25,
            containerColor: blueBlack,
            widget: Padding(
              padding: const EdgeInsets.all(8),
              child: appText(
                text: model.categoriesName!,
                color: white,
              ),
            ),
          ),
        )
      ],
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
