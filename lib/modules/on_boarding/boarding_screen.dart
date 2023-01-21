import 'package:ariam_handcraft/shared/style/widgets/defultButton.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/board_model.dart';
import '../../shared/component/routes_strings.dart';
import '../../shared/component/strings.dart';
import '../../shared/helper/shared_preferences.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/image_strings.dart';
import '../../shared/style/widgets/defualtText.dart';

class BoardingScreen extends StatefulWidget {
  BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  List<BoardModel> boardItems = [
    BoardModel(body: "Women bags", image: board1image, title: "Choose your design"),
    BoardModel(body: "Accessories", image: board2image, title: "New designs"),
    BoardModel(
        body: "Concerts planner", image: board3image, title: "Creativity design"),
    BoardModel(body: "Crochet", image: board4image, title: "Crochet products"),
  ];
  var boardController = PageController();
  bool isLast = false;
  void submit() {
    CacheHelper.saveData(
      key: cashHelperOnBoardingKey,
      value: true,
    ).then((value) {
      if (value) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageBack), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      submit();
                      Navigator.popAndPushNamed(context, checkUser);
                    },
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: appText(text: "skip"),
                        )),
                  ),
                  Row(
                    children: [
                      appText(text: appName, size: 65),
                      Spacer(),
                      Image.asset(
                        imageLogo,
                        height: height * .2,
                      )
                    ],
                  ),
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
                    height: height * .01,
                  ),
                  SizedBox(
                    height: height * .5,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          onBoardScreen(boardItems[index], height, width),
                      itemCount: boardItems.length,
                      controller: boardController,
                      onPageChanged: (int index) {
                        if (index == boardItems.length - 1) {
                          setState(() {
                            isLast = true;
                            print(isLast);
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boardItems.length,
                    effect: ExpandingDotsEffect(
                        dotColor: fayroozy,
                        activeDotColor: blueBlack,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 10,
                        expansionFactor: 2.0),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: isLast == true
                          ? InkWell(
                              child: appText(
                                text: "let's shop",
                              ),
                              onTap: () {
                                submit();
                                Navigator.pushReplacementNamed(context, checkUser);
                              },
                            )
                          : null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget onBoardScreen(BoardModel board, height, width) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * .4,
            width: width * .85,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage(board.image!), fit: BoxFit.cover),
                color: fayroozy.withOpacity(0.5)),
          ),
          SizedBox(
            height: height * .02,
          ),
          appText(text: board.body!, color: black),
          SizedBox(
            height: height * .01,
          ),
          appText(text: board.title!, color: fayroozy),
        ],
      ),
    );
  }
}
