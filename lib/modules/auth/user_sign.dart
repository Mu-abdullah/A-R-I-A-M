import 'package:ariam_handcraft/shared/component/routes_strings.dart';
import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:ariam_handcraft/shared/cubit/auth/auth_cubit.dart';
import 'package:ariam_handcraft/shared/cubit/auth/auth_state.dart';
import 'package:ariam_handcraft/shared/style/image_strings.dart';
import 'package:ariam_handcraft/shared/style/widgets/border_container.dart';
import 'package:ariam_handcraft/shared/style/widgets/defultButton.dart';
import 'package:ariam_handcraft/shared/style/widgets/defultFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../shared/helper/shared_preferences.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/widgets/defualtText.dart';

class UserSign extends StatelessWidget {
  UserSign({Key? key, required this.phoneNumber}) : super(key: key);

  final phoneNumber;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  void submitSharedUser({required String key, required dynamic value}) {
    CacheHelper.saveData(
      key: key,
      value: value,
    ).then((value) {
      if (value) {}
    });
  }

  late String otpCode;
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageBack), fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          imageLogo,
                          height: height * .3,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: appText(text: appName, size: 72)),
                    Align(
                      alignment: Alignment.center,
                      child: appText(
                          text: "Choose your design to be unique",
                          size: 30,
                          color: fayroozy,
                          maxLine: 10),
                    ),
                    Divider(
                      thickness: height * .002,
                      height: height * .02,
                      endIndent: height * .1,
                      indent: height * .1,
                      color: simon,
                    ),
                    SizedBox(
                      height: height * .1,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: appText(
                        text: "Add your information to sign",
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        width: width * .75,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                child: defaultFormField(
                                  controller: name,
                                  type: TextInputType.text,
                                  hint: "Your Name",
                                  label: "Name",
                                  prefix: Iconsax.profile_circle,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Enter your name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: cubit.firebaseUserPhone != null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          defaultFormField(
                                            controller: phone,
                                            type: TextInputType.number,
                                            prefix: Iconsax.call,
                                            label: "Phone",
                                            hint: "Your Phone",
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your phone number!';
                                              } else if (value.length < 11) {
                                                return 'Too short for a phone number!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          borderContainer(
                                            widget: Center(
                                                child:
                                                    appText(text: phoneNumber)),
                                            borderWidth: 1,
                                            width: width,
                                            height: height * .07,
                                            borderColor: blueBlack,
                                            topLeft: 20,
                                            bottomRight: 20,
                                            topRight: 20,
                                            bottomLeft: 20,
                                          ),
                                        ],
                                      ),
                              ),
                              Center(
                                child: cubit.verificationId != null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: height * .01,
                                          ),
                                          PinCodeTextField(
                                            appContext: context,
                                            autoFocus: true,
                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
                                            length: 6,
                                            obscureText: false,
                                            animationType: AnimationType.scale,
                                            pinTheme: PinTheme(
                                              shape: PinCodeFieldShape.box,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              fieldHeight: 50,
                                              fieldWidth: 40,
                                              borderWidth: 1,
                                              activeColor: blueBlack,
                                              inactiveColor: blueBlack,
                                              inactiveFillColor:
                                                  Colors.transparent,
                                              activeFillColor: fayroozy,
                                              selectedColor: fayroozy,
                                              selectedFillColor: Colors.white,
                                            ),
                                            animationDuration: const Duration(
                                                milliseconds: 300),
                                            backgroundColor: Colors.transparent,
                                            enableActiveFill: true,
                                            onCompleted: (submittedCode) {
                                              otpCode = submittedCode;
                                              cubit.submitOTP(otpCode);
                                              // snackBar(
                                              //   context,
                                              //   seconds: 5,
                                              //   contentText: "Wait a moment"
                                              // );
                                            },
                                            onChanged: (value) {
                                              otpCode = value;
                                              print(value);
                                            },
                                          ),
                                        ],
                                      )
                                    : null,
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Center(
                                child: state is Loading
                                    ? CircularProgressIndicator(
                                        color: fayroozy,
                                      )
                                    : Center(
                                        child: state is! PhoneOTPVerified
                                            ? defaultButton(
                                                function: () async {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    cubit
                                                        .submitPhoneNumber(
                                                            phoneNumber:
                                                                phoneNumber)
                                                        .then((value) {
                                                      // Navigator.pushReplacementNamed(context, bottomNavigationBar);
                                                    });
                                                  }
                                                },
                                                text: "Verified your phone")
                                            : defaultButton(
                                                function: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    submitSharedUser(
                                                      key:
                                                          cashHelperUserNameKey,
                                                      value: name.text,
                                                    );
                                                    submitSharedUser(
                                                      key:
                                                          cashHelperUserPhoneKey,
                                                      value: phoneNumber,
                                                    );
                                                    cubit.sendUserData(
                                                      userName: name.text,
                                                      userPhone: phoneNumber,
                                                      userState: userStateKey,
                                                    );
                                                    Navigator
                                                        .pop(
                                                            context,
                                                            bottomNavigationBar);
                                                  }
                                                },
                                                text: "Sign in"),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
