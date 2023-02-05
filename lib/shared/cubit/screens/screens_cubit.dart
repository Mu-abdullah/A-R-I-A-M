import 'dart:convert';

import 'package:ariam_handcraft/modules/screens/category_screen/bouquet.dart';
import 'package:ariam_handcraft/modules/screens/category_screen/concert_planner.dart';
import 'package:ariam_handcraft/modules/screens/category_screen/crochet.dart';
import 'package:ariam_handcraft/modules/screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../models/prodcuts_model.dart';
import '../../../modules/screens/cart_screen.dart';
import '../../../modules/screens/category.dart';
import '../../../modules/screens/category_screen/accessories.dart';
import '../../../modules/screens/favourite_screen.dart';
import '../../component/strings.dart';
import '../../network/remote/get_data.dart';
import '../../style/colors.dart';
import '../../style/widgets/defualtText.dart';
import 'screens_state.dart';

class ScreensCubit extends Cubit<ScreensState> {
  ScreensCubit() : super(GeneralInitial());
  static ScreensCubit get(context) => BlocProvider.of(context);

  //////////////BottomNavigationBar/////////////////
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const CartScreen(),
  ];
  List<SalomonBottomBarItem> items = [
    SalomonBottomBarItem(
      icon: const Icon(Iconsax.home),
      title: appText(
        text: 'Home',
        size: 18,
      ),
    ),
    SalomonBottomBarItem(
      icon: const Icon(Iconsax.category),
      title: appText(
        text: 'Category',
        size: 18,
      ),
    ),
    SalomonBottomBarItem(
      icon: const Icon(Iconsax.heart4),
      title: appText(
        text: "Favourite",
        size: 18,
      ),
    ),
    SalomonBottomBarItem(
      icon: const Icon(Iconsax.shopping_cart),
      title: appText(
        text: "Cart",
        size: 18,
      ),
    ),
  ];
  void changeBarItem(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      HomeScreen();
    } else if (currentIndex == 2) {
      FavouriteScreen();
    } else if (currentIndex == 3) {
      CartScreen();
    } else if (currentIndex == 4) {
      CategoryScreen();
    }
    emit(ChangeBarItem());
  }

  //////////////TopTabNavigationBar/////////////////
  List<Widget> topTabs = [
    appText(
      text: crochet,
      size: 21,
    ),
    appText(text: bouquet, size: 21),
    appText(text: planner, size: 21),
    appText(text: accessories, size: 21),
  ];
  List<Widget> categoryScreen = [
    const Crochet(),
    const Bouquet(),
    const ConcertPlanner(),
    const Accessories(),
  ];

  //Favourite Button
  bool pressed = false;
  var favIcon = Icon(
    Iconsax.heart4,
    color: white,
  );
  void pressedFavourite() {
    pressed = !pressed;
    favIcon = pressed
        ? Icon(
            Iconsax.heart5,
            color: red,
          )
        : Icon(
            Iconsax.heart4,
            color: white,
          );
    emit(IsFavourite());
  }
  // List<Map<String, ProductModel>> postsList = [];
  // ProductModel? productModel ;
  // void getData(String id){
  //   emit(Loading());
  //   FirebaseFirestore.instance.collection(productsKey).get().then((value){
  //     productModel = ProductModel.fromFirestore(value.data()!);
  //   });
  //
  //
  //   emit(Success());
  // }

//////////////////////////Category
    List<ProductModel> prod = [];
    ProductModel? productModel;
  Future<void> getData() async {
    await FirebaseFirestore.instance.collection(productsKey).get().then((value) {
      List<ProductModel> newList = [];
      QuerySnapshot data = value;
      for (var element in data.docs) {
        productModel = ProductModel(
          name: element['name'],
          admin: element['admin'],
          adminID: element['adminID'],
          adminState: element['adminState'],
          img: element['img'],
          price: element['price'],
          description: element['description'],
          discount: element['discount'],
          dayToDelivery: element['dayToDelivery'],
          isDiscount: element['isDiscount'],
          categoryId: element['categoryId'],
        );
        print(element['description']);
        newList.add(productModel!);
      }
      // prod = newList.toList();


    }).catchError((onError) {});
  }
}
