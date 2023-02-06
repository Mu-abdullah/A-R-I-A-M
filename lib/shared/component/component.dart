import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../style/colors.dart';
import '../style/image_strings.dart';
import '../style/widgets/border_container.dart';
import '../style/widgets/defualtText.dart';

Widget adminPanelCard(
  context,
  height,
  width, {
  required String image,
  required String productsName,
  required String productsPrice,
  required String productsDescription,
  required String daysToDelivery,
  required String discount,
  required String category,
}) {
  return Column(
    children: [
      Container(
        height: height * .25,
        width: width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              colors: [fayroozy, blueBlack],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.2, 0.6],
              tileMode: TileMode.repeated,
            )),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Expanded(

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: white,
                      width: 1,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    appText(
                      text: "Description: $productsDescription",
                      color: white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: height * .01,
      ),
    ],
  );
}
// Column(
// children: [
// Container(
// height: height * .25,
// width: width,
// decoration:const BoxDecoration(
// borderRadius:  BorderRadius.all(Radius.circular(10)),
// gradient: LinearGradient(
// colors: [fayroozy, gery],
// begin: Alignment.bottomLeft,
// end: Alignment.topRight,
// stops:  [0.2, 0.6],
// tileMode: TileMode.repeated,
// )),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Container(
// width: width * .36,
// decoration: BoxDecoration(
// image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
// borderRadius: BorderRadius.circular(10),
// border: Border.all(color: white,width:3 ),
// ),
// ),
// SizedBox(
// width: width * .02,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// appText(
// text:  "Name: $productsName",
// ),
// appText(
// text: "Price: $productsPrice LE",
// size: 18,
// ),
// Wrap(
// children: [
// appText(
// text: "Description: $productsDescription",
// size: 18,
// maxLine: 20,
// ),
// ],
// ),
// appText(
// text: "Day: $daysToDelivery days",
// size: 18,
// ),
// appText(
// text: "Discount: $discount %",
// size: 18,
// ),
// appText(
// text: "Category: $category",
// size: 18,
// ),
// ],
// ),
// SizedBox(
// width: width * .02,
// ),
// const Icon(Iconsax.edit4),
// ],
// ),
// ),
// ),
// SizedBox(height: height*.01,)
// ],
// )
