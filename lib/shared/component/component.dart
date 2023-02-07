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
      required final Function()? edite,
      required final Function()? delete,
}) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: Container(
      height: height * .35,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                appText(
                  text: "Name: $productsName",
                  color: white,
                  size: 21,
                ),
                const Spacer(),
                GestureDetector(
                  onTap:edite,
                  child: const Icon(Iconsax.edit4, color: white),
                ),
                SizedBox(width: width*.03,),
                GestureDetector(
                  onTap: delete,
                  child: const Icon(Iconsax.note_remove4, color: white),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height * .25,
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
                SizedBox(
                  width: width * .02,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                        text: "Description: $productsDescription",
                        color: white,
                        maxLine: 3,
                        size: 18,
                      ),
                      appText(
                        text: "Price: $productsPrice EGP",
                        color: white,
                        size: 18,
                      ),
                      appText(
                        text: "Discount: $discount %",
                        color: white,
                        size: 18,
                      ),
                      appText(
                        text: "Day: $daysToDelivery days",
                        color: white,
                        size: 18,
                      ),
                      appText(
                        text: "Category: $category",
                        color: white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
