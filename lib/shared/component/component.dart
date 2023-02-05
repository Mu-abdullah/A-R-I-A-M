import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../style/colors.dart';
import '../style/image_strings.dart';
import '../style/widgets/border_container.dart';
import '../style/widgets/defualtText.dart';

Widget adminPanelCard(
  context,
  height,
  width,
) {
  return Container(
    height: height * .25,
    width: width ,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
          colors: [fayroozy, gery],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: const [0.2, 0.6],
          tileMode: TileMode.repeated,
        )),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          borderContainer(
            widget: Image.asset(imageLogo),
            bottomLeft: 25,
            topRight: 25,
            bottomRight: 25,
            topLeft: 25,
            borderColor: white,
            width: width * .36,
            borderWidth: 3,
          ),
          SizedBox(
            width: width * .02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText(
                text: "ProductsName",
              ),
              appText(
                text: "ProductsPrice",
                size: 21,
              ),
              appText(
                text: "ProductsDescription",
                size: 21,
                maxLine: 3,
              ),
              appText(
                text: "DaysToDelivery",
                size: 21,
              ),
              appText(
                text: "Discount",
                size: 21,
              ),
              appText(
                text: "Category",
                size: 21,
              ),
            ],
          ),
          SizedBox(
            width: width * .02,
          ),
          const Icon(Iconsax.edit4),
        ],
      ),
    ),
  );
}
