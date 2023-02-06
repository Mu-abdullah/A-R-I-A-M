import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? docID;
  String? categoryId;
  String? admin;
  String? adminID;
  String? adminState;
  String? name;
  String? img;
  String? description;
  String? dayToDelivery;
  dynamic price;
  dynamic discount;
  bool? isDiscount;

  ProductModel({
    this.docID,
    required this.name,
    required this.admin,
    required this.adminID,
    required this.adminState,
    required this.img,
    required this.price,
    required this.description,
    required this.discount,
    required this.dayToDelivery,
    required this.isDiscount,
    required this.categoryId,
  });

  factory ProductModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ProductModel(
      name: data?['name'],
      admin: data?['admin'],
      adminID: data?['adminID'],
      adminState: data?['adminState'],
      img: data?['img'],
      price: data?['price'],
      description: data?['description'],
      dayToDelivery: data?['dayToDelivery'],
      discount: data?['discount'],
      isDiscount: data?['isDiscount'],
      docID: data?['docID'],
      categoryId: data?['categoryId'],
    );
  }
  //  ProductModel.fromFirestore(Map<String, dynamic> json) {
  //    name = json['name'] ?? '';
  //    admin = json['admin'] ?? '';
  //    adminID = json['adminID'] ?? '';
  //    adminState = json['adminState'] ?? '';
  //    img = json['img'] ?? '';
  //    price = json['price'] ?? '';
  //    description = json['description'] ?? '';
  //    dayToDelivery = json['dayToDelivery'] ?? '';
  //    discount = json['discount'] ?? '';
  //    isDiscount = json['isDiscount'] ?? '';
  //    docID = json['docID'] ?? '';
  //    categoryId = json['categoryId'] ?? '';
  //
  // }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (admin != null) "admin": admin,
      if (adminID != null) "adminID": adminID,
      if (adminState != null) "adminState": adminState,
      if (img != null) "img": img,
      if (price != null) "price": price,
      if (description != null) "description": description,
      if (dayToDelivery != null) "dayToDelivery": dayToDelivery,
      if (discount != null) "discount": discount,
      if (isDiscount != null) "isDiscount": isDiscount,
      if (docID != null) "docID": docID,
      if (categoryId != null) "categoryId": categoryId,
    };
  }
}
