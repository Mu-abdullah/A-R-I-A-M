import 'package:ariam_handcraft/shared/cubit/auth/auth_state.dart';
import 'package:ariam_handcraft/shared/style/widgets/snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user_model.dart';
import '../../component/routes_strings.dart';
import '../../component/strings.dart';
import '../../helper/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  String? verificationId;
  AuthCubit() : super(UserSignInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> submitPhoneNumber({required String phoneNumber}) async {
    emit(Loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccurred(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(ErrorOccurred(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

  late UserModel model;
  void sendUserData({
    required String userName,
    required String userPhone,
    required String userState,
  }) {
    final user = UserModel(
        userName: userName, userPhone: userPhone, userState: userState);
    FirebaseFirestore.instance
        .collection(userKey)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(),
        )
        .add(
          user,
        );
  }

  void submitSharedUser({required String key, required dynamic value}) {
    CacheHelper.saveData(
      key: key,
      value: value,
    ).then((value) {
      if (value) {}
    });
  }

  String? firebaseUserPhone;
  String? firebaseUserName;
  CollectionReference reference =
      FirebaseFirestore.instance.collection(userKey);
  void filter(context, {required String phoneNumber}) async {
    emit(Loading());
    reference.where("userPhone", isEqualTo: phoneNumber).get().then((value) {
      for (var element in value.docs) {
        firebaseUserPhone = element['userPhone'];
        firebaseUserName = element['userName'];
        if (firebaseUserPhone != null) {
          emit(SuccessUserExit());
          submitSharedUser(
            key: cashHelperUserNameKey,
            value: firebaseUserName,
          );
          submitSharedUser(
            key: cashHelperUserPhoneKey,
            value: firebaseUserPhone,
          );
          snackBar(context,
              contentText: "Welcome back $firebaseUserName", seconds: 5);
          Navigator.pushReplacementNamed(context, bottomNavigationBar);
          emit(SuccessGetUserExitData());
        }
      }
    }).catchError((onError) {
      emit(FailedUserExit());
    });
    reference.where("userPhone", isNotEqualTo: phoneNumber).get().then((value) {
      for (var element in value.docs) {
        emit(SuccessNoUserExit());
      }
    }).catchError((onError) {
      emit(FailedUserExit());
    });
  }

  void adminLogin(context,
      {required String mail, required String password}) async {
    emit(Loading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: password);
      Navigator.pushReplacementNamed(context, adminHome);
      emit(AdminLoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AdminLoginFailed());
        snackBar(context, contentText: "User not found", seconds: 5);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(AdminLoginFailed());
        snackBar(context, contentText: "Wrong password provided for that user", seconds: 5);
        print('Wrong password provided for that user.');
      }
    }
  }
}


