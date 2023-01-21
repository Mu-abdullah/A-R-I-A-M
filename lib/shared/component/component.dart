import 'package:ariam_handcraft/models/category_model.dart';
import 'package:ariam_handcraft/models/prodcuts_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../style/colors.dart';
import '../style/image_strings.dart';
import '../style/widgets/border_container.dart';
import '../style/widgets/defualtText.dart';
import '../style/widgets/defultFormField.dart';

Widget adminPanelCard(
  context,
  height,
  width,
) {
  return Container(
    height: height * .25,
    width: width * .95,
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
        children: [
          borderContainer(
            widget: Image.asset(imageLogo),
            bottomLeft: 25,
            topRight: 25,
            bottomRight: 25,
            topLeft: 25,
            borderColor: white,
            width: width * .4,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    showBottomSheet(
                        context: (context),
                        builder: (context) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                child: Column(
                                  children: [
                                    defaultFormField(
                                        controller: TextEditingController(),
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Title must not be empty';
                                          }
                                          return null;
                                        },
                                        label: 'الجهة',
                                        type: TextInputType.text,
                                        prefix: Icons.title),
                                  ],
                                ),
                              ),
                            ));
                  },
                  icon: const Icon(Iconsax.edit4))
            ],
          ),
        ],
      ),
    ),
  );
}
