import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ariam_handcraft/shared/style/colors.dart';
import 'package:ariam_handcraft/shared/style/widgets/defualtText.dart';
import 'package:ariam_handcraft/shared/style/widgets/defultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/component/strings.dart';
import '../../shared/cubit/screens/screens_cubit.dart';
import '../../shared/cubit/screens/screens_state.dart';
import '../../shared/style/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ScreensCubit, ScreensState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: appText(text: "Profile", color: white),
                backgroundColor: blueBlack,
              ),
              body: SizedBox(
                height: height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          imageProfile,
                                          height: height * .3,
                                        ),
                                      ),
                                      appText(
                                        text: "$userName",
                                        size: 48,
                                      ),
                                      appText(
                                        text: "$userPhone",
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Divider(
                                        thickness: height * .002,
                                        height: height * .02,
                                        endIndent: height * .01,
                                        indent: height * .2,
                                        color: simon,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: appText(
                                          text: "History",
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Container(
                                        height: height * .1,
                                        width: width * .8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25)),
                                            gradient: LinearGradient(
                                              colors: [fayroozy, black],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              stops: const [0.2, 0.6],
                                              tileMode: TileMode.repeated,
                                            )),
                                        child: Center(
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                'No previous items',
                                                textStyle: TextStyle(
                                                  color: white,
                                                  fontSize: 24,
                                                ),
                                                speed: const Duration(
                                                    milliseconds: 100),
                                              ),
                                            ],
                                            repeatForever: false,
                                            totalRepeatCount: 1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Divider(
                                        thickness: height * .002,
                                        height: height * .02,
                                        endIndent: height * .2,
                                        indent: height * .01,
                                        color: simon,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: appText(
                                          text: "Order",
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Container(
                                        height: height * .1,
                                        width: width * .8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25)),
                                            gradient: LinearGradient(
                                              colors: [blueBlack, black],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              stops: const [0.2, 0.6],
                                              tileMode: TileMode.repeated,
                                            )),
                                        child: Center(
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                'No order here',
                                                textStyle: TextStyle(
                                                  color: white,
                                                  fontSize: 24,
                                                ),
                                                speed: const Duration(
                                                    milliseconds: 100),
                                              ),
                                              TypewriterAnimatedText(
                                                'go home and',
                                                textStyle: TextStyle(
                                                  color: white,
                                                  fontSize: 24,
                                                ),
                                                speed: const Duration(
                                                    milliseconds: 100),
                                              ),
                                              TypewriterAnimatedText(
                                                'give me some items',
                                                textStyle: TextStyle(
                                                  color: white,
                                                  fontSize: 24,
                                                ),
                                                speed: const Duration(
                                                    milliseconds: 100),
                                              ),
                                            ],
                                            repeatForever: false,
                                            totalRepeatCount: 1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Divider(
                                        thickness: height * .002,
                                        height: height * .02,
                                        endIndent: height * .1,
                                        indent: height * .1,
                                        color: simon,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child:
                                                  appText(text: "Connect us"))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Iconsax.call,
                                                size: 60,
                                                color: fayroozy,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.whatsapp,
                                                size: 60,
                                                color: fayroozy,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.facebook,
                                                size: 60,
                                                color: fayroozy,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Iconsax.instagram,
                                                size: 60,
                                                color: fayroozy,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: defaultButton(
                              function: () {},
                              text: "logout",
                              textColor: red,
                              background: white,
                              fontSize: 24)),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
