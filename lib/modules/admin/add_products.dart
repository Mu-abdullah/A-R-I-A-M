import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../shared/cubit/add_products/add_data_cubit.dart';
import '../../shared/cubit/add_products/add_data_state.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/image_strings.dart';
import '../../shared/style/widgets/border_container.dart';
import '../../shared/style/widgets/defualtText.dart';
import '../../shared/style/widgets/defultButton.dart';
import '../../shared/style/widgets/defultFormField.dart';
import '../../shared/style/widgets/progress_indecator.dart';

class AddDataScreen extends StatelessWidget {
  AddDataScreen({Key? key}) : super(key: key);

  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDiscount = TextEditingController();
  TextEditingController dayToDelivery = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  String? categoryValue;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDataCubit, AddDataState>(
      listener: (context, state) {
        if (state is SendDataLoading) {
          showProgressIndicator(context);
        }
      },
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        AddDataCubit cubit = AddDataCubit.get(context);
        var productImageFile = cubit.image;
        var imageUrl = cubit.imageUrl;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: appText(text: "Add Products", color: white),
              backgroundColor: blueBlack,
              elevation: 10,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///////////Image////////////
                      Container(
                          height: height * .75,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25),
                              ),
                              image: productImageFile == null
                                  ? DecorationImage(
                                      image: AssetImage(imageLogo),
                                    )
                                  : DecorationImage(
                                      image: FileImage(productImageFile),
                                      fit: BoxFit.fitHeight),
                              color: fayroozy),
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {
                                      cubit.getImage();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: blueBlack,
                                      maxRadius: height * .04,
                                      child: const Icon(
                                        Iconsax.gallery_add,
                                        size: 40,
                                        color: white,
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                      //////////HandelDataToAdd////////////
                      SizedBox(
                        height: height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: state is UploadProductImageLoading
                            ? const LinearProgressIndicator(
                                color: fayroozy,
                              )
                            : null,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: defaultFormField(
                              controller: productName,
                              type: TextInputType.text,
                              prefix: Iconsax.note_text,
                              hint: "Product Name",
                              label: "Product Name",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "Product Name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: width*.01,),
                          Expanded(
                            flex: 1,
                            child: borderContainer(
                              containerColor: gery,
                              bottomLeft: 15,
                              topRight: 15,
                              bottomRight: 15,
                              topLeft: 15,
                              widget: Padding(
                                padding: const EdgeInsets.all(2),
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: appText(text: "Category", color: fayroozy,size: 18,),
                                  items: cubit.dropdownItems,
                                  value: cubit.selectedValue,
                                  onChanged: (String? value) {
                                    cubit.changeValue(value!);
                                    categoryValue = value;
                                    print(value);
                                  },
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(25)),
                                  dropdownColor: gery,
                                  underline: const Text(""),
                                  elevation: 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: defaultFormField(
                              controller: productPrice,
                              type: TextInputType.number,
                              prefix: Iconsax.money_2,
                              hint: "Product Price",
                              label: "Product Price",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "Product Price";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: width*.03,),
                          Expanded(
                            flex: 1,
                            child: appText(
                              text: "discount ?",
                              size: 18,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: NeumorphicSwitch(
                              style: const NeumorphicSwitchStyle(
                                lightSource: LightSource(25, 10),
                                  activeThumbColor: white,
                                  inactiveThumbColor: blueBlack,
                                  activeTrackColor: fayroozy,
                                  inactiveTrackColor: red),
                              value: cubit.isDisc,
                              onChanged: (bool value) {
                                cubit.disc();
                              },
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: cubit.isDisc == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  defaultFormField(
                                    controller: productDiscount,
                                    type: TextInputType.number,
                                    prefix: Iconsax.discount_circle,
                                    hint: "Product Discount",
                                    label: "Product Discount",
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "Product Name";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              )
                            : null,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      defaultFormField(
                        controller: dayToDelivery,
                        type: TextInputType.number,
                        prefix: Iconsax.calendar,
                        hint: "Day to Delivery",
                        label: "Day to Delivery",
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Days";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      defaultFormField(
                        controller: productDescription,
                        type: TextInputType.text,
                        prefix: Iconsax.note_text,
                        hint: "Description",
                        label: "Description",
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Product Description";
                          }
                          return null;
                        },
                        maxLines: 10,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Center(
                        child: cubit.image == null
                            ? appText(text: "Choose Image", color: red)
                            : Padding(
                                padding: const EdgeInsets.all(0),
                                child: state is UploadProductImageSuccess?
                                    ? Center(
                                        child: state is SendDataLoading
                                            ? const CircularProgressIndicator(
                                                color: fayroozy,
                                              )
                                            : defaultButton(
                                                text: "add products",
                                                function: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    cubit.addProductData(
                                                      context,
                                                      img: imageUrl!,
                                                      price: productPrice.text,
                                                      isDiscount: cubit.isDisc,
                                                      discount:
                                                          cubit.isDisc == false
                                                              ? "0"
                                                              : productDiscount
                                                                  .text,
                                                      description:
                                                          productDescription
                                                              .text,
                                                      categoryId: cubit
                                                                  .selectedValue ==
                                                              null
                                                          ? "Crochet"
                                                          : cubit
                                                              .selectedValue! /*categoryValue!*/,
                                                      name: productName.text,
                                                      dayToDelivery:
                                                          dayToDelivery.text,
                                                      admin: userName!,
                                                      adminState: "admin",
                                                    );
                                                  }
                                                },
                                              ),
                                      )
                                    : Center(
                                        child: state
                                                is UploadProductImageLoading
                                            ? const CircularProgressIndicator(
                                                color: fayroozy,
                                              )
                                            : defaultButton(
                                                text: "upload image",
                                                function: () {
                                                  cubit.uploadPhoto(context,
                                                      cubit.selectedValue!);
                                                },
                                              ),
                                      ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
