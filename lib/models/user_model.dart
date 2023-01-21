import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userName;
  String? userPhone;
  String? userAddress;
  String? userState;

  UserModel(
      {required this.userName,
      required this.userPhone,
      required this.userState,
      this.userAddress});

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      userName: data?['userName'],
      userPhone: data?['userPhone'],
      userState: data?['userState'],
      userAddress: data?['userAddress'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (userName != null) "userName": userName,
      if (userPhone != null) "userPhone": userPhone,
      if (userState != null) "userState": userState,
      if (userAddress != null) "userAddress": userAddress,
    };
  }
}
