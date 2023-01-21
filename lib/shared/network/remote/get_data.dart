

import 'package:ariam_handcraft/models/prodcuts_model.dart';
import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getAllData () async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  // final ref = db.collection(productsKey).doc().withConverter(
  //   fromFirestore: ProductModel.fromFirestore,
  //   toFirestore: (ProductModel product, _) => product.toFirestore(),
  // );
  // final docSnap = await ref.get();
  // final product = docSnap.data(); // Convert to City object
  // if (product != null) {
  //   print(product);
  // } else {
  //   print("No such document.");
  // }


}