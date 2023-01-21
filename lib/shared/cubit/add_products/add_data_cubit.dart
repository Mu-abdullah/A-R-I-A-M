import 'dart:io';
import 'package:ariam_handcraft/models/prodcuts_model.dart';
import 'package:ariam_handcraft/shared/style/widgets/snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import '../../component/routes_strings.dart';
import '../../component/strings.dart';
import '../../style/widgets/defualtText.dart';
import 'add_data_state.dart';
import 'package:firebase_storage/firebase_storage.dart' as fire_storage;

class AddDataCubit extends Cubit<AddDataState> {
  AddDataCubit() : super(AddDataInitial());

  static AddDataCubit get(context) => BlocProvider.of(context);

  ////////////////////is discount////////////////////
  bool isDisc = false;
  void disc() {
    isDisc = !isDisc;
    emit(IsDiscount());
  }

////////////////////drop menu////////////////////
  String? selectedValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: crochet, child: appText(text: "Crochet")),
      DropdownMenuItem(value: bouquet, child: appText(text: "Bouquet")),
      DropdownMenuItem(value: planner, child: appText(text: "Planner")),
      DropdownMenuItem(value: accessories, child: appText(text: "Accessories")),
    ];
    return menuItems;
  }

  void changeValue(String value) {
    selectedValue = value;
    emit(ChangeToggle());
  }

////////////////////image picker////////////////////
  File? image;
  var picker = ImagePicker();
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(GetProductImageFileSuccess());
    } else {
      print("No Image Selected");
      emit(GetProductImageFileError());
    }
  }

////////////////////AddData////////////////////
  String? imageUrl;
  void uploadPhoto(context, categoryId) {
    emit(UploadProductImageLoading());
    snackBar(context, contentText: "Uploading", seconds: 1);
    fire_storage.FirebaseStorage.instance
        .ref()
        .child(
            "$productsKey/$categoryId/${Uri.file(image!.path).pathSegments.last}")
        .putFile(image!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        print(value);
        imageUrl = value;
        snackBar(context, contentText: "Done", seconds: 1);
        emit(UploadProductImageSuccess());
      }).catchError((onError) {
        emit(UploadProductImageError(onError.toString()));
      });
    }).catchError((onError) {
      emit(UploadProductImageError(onError.toString()));
    });
  }

  var fs = FirebaseFirestore.instance;

  Future<void> addProductData(
    context, {
    required String name,
    required String admin,
    required String adminState,
    required String img,
    required String price,
    required String description,
    required String dayToDelivery,
    required String discount,
    required bool isDiscount,
    required String categoryId,
    String? id,
  }) async {
    var docId = FirebaseFirestore.instance
        .collection(adminKey)
        .doc(productsKey)
        .id;
    var userId = FirebaseAuth.instance.currentUser?.uid;

    final productsData = ProductModel(
        name: name,
        admin: admin,
        adminID: userId,
        adminState: adminState,
        img: img,
        price: price,
        description: description,
        dayToDelivery: dayToDelivery,
        discount: discount,
        isDiscount: isDiscount,
        categoryId: categoryId,
        docID: docId);
    emit(SendDataLoading());
    await fs
        .collection(productsKey)
        .add(productsData.toFirestore())
        .then((value) {
      Navigator.pushReplacementNamed(context, adminHome);
      emit(SendDataSuccess());
    }).catchError((onError) {
      emit(SendDataError(onError.toString()));
    });
  }
}
