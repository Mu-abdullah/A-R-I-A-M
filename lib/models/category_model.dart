import 'package:ariam_handcraft/models/prodcuts_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? categoriesName;
  String? categoryImg;
  String? categoryId;
  // List<ProductModel>? product;

  CategoryModel(
      {required this.categoriesName,
      required this.categoryImg,
      required this.categoryId,
      // this.product
      });
   CategoryModel.fromJson(Map<String, dynamic> json){
     categoriesName = json['categoriesName'] ?? '';
     categoryImg = json['categoryImg'] ?? '';
     categoryId = json['categoryId'] ?? '';
     // product = List.from(json['product']).map((e) => ProductModel.fromFirestore(e)).toList();

  }

  Map<String, dynamic> toFirestore() {
    return {
      if (categoriesName != null) "categoriesName": categoriesName,
      if (categoryImg != null) "categoryImg": categoryImg,
      if (categoryId != null) "categoryId": categoryId,
      // if (product != null)
      //   "ProductModel": product!.map((v) => v.toFirestore()).toList(),
    };
  }
}
