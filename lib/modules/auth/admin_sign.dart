import 'package:ariam_handcraft/shared/component/routes_strings.dart';
import 'package:ariam_handcraft/shared/component/strings.dart';
import 'package:ariam_handcraft/shared/cubit/auth/auth_cubit.dart';
import 'package:ariam_handcraft/shared/cubit/auth/auth_state.dart';
import 'package:ariam_handcraft/shared/style/image_strings.dart';
import 'package:ariam_handcraft/shared/style/widgets/defultButton.dart';
import 'package:ariam_handcraft/shared/style/widgets/defultFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/helper/shared_preferences.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/widgets/defualtText.dart';

class AdminSign extends StatelessWidget {
  AdminSign({Key? key}) : super(key: key);
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
                        text: "Add your mail to sign",
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
                              defaultFormField(
                                controller: mail,
                                type: TextInputType.text,
                                hint: "Your Email",
                                label: "Email",
                                prefix: Iconsax.profile_circle,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return "Enter your email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              defaultFormField(
                                controller: password,
                                type: TextInputType.visiblePassword,
                                prefix: Iconsax.call,
                                label: "Password",
                                hint: "Password",
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return "Enter your password";
                                  }
                                  // if (value<11) return "Enter Right Number";
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Center(
                                child: state is Loading
                                    ? CircularProgressIndicator(
                                        color: fayroozy,
                                      )
                                    : defaultButton(
                                        function: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.adminLogin(context,
                                                mail: mail.text,
                                                password: password.text,
                                            );

                                          }
                                        },
                                        text: "Admin Login"),
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
