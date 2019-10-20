import 'package:flutter/material.dart';
import 'package:messaging_app/config/assets.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/config/styles.dart';
import 'package:messaging_app/config/transitions.dart';
import 'package:messaging_app/pages/conversation_page_slide.dart';
import 'package:messaging_app/widget/circle_indicator.dart';
import 'package:numberpicker/numberpicker.dart';

class PassportPage extends StatefulWidget {
  @override
  _PassportPageState createState() => new _PassportPageState();
}

class _PassportPageState extends State<PassportPage> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  int currentPage = 0;
  int age = 18;
  bool isKeyboardOpen = false;

  //
  var begin = Alignment.center;
  var end = Alignment.bottomRight;

  PageController pageController = PageController();

  //
  AnimationController usernameFieldAnimationController;
  Animation profilePicHeightAnimation, usernameAnimation, ageAnimation;
  FocusNode usernameFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    usernameFieldAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    profilePicHeightAnimation = Tween(begin: 100, end: 0).animate(usernameFieldAnimationController)
      ..addListener(() {
        setState(() {});
      });

    usernameAnimation = Tween(begin: 50, end: 10).animate(usernameFieldAnimationController)
      ..addListener(() {
        setState(() {});
      });
    ageAnimation = Tween(begin: 80, end: 10).animate(usernameFieldAnimationController)
      ..addListener(() {
        setState(() {});
      });

    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        usernameFieldAnimationController.forward();
      } else {
        usernameFieldAnimationController.reverse();
      }
    });

    pageController.addListener(() {
      setState(() {
        begin = Alignment(pageController.page, pageController.page);
        end = Alignment(1 - pageController.page, 1 - pageController.page);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    usernameFieldAnimationController.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = MediaQuery.of(context).viewInsets.bottom;
    if (value > 0) {
      if (isKeyboardOpen) {
        onKeyboardChanged(false);
      }
      isKeyboardOpen = false;
    } else {
      isKeyboardOpen = true;
      onKeyboardChanged(true);
    }
  }

  onKeyboardChanged(bool isVisible) {
    if (!isVisible) {
      FocusScope.of(context).requestFocus(FocusNode());
      usernameFieldAnimationController.reverse();
    }
  }

  Future<bool> onWillPop() {
    if (currentPage == 1) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  navigateToHome() {
    Navigator.push(context, SlideLeftRoute(page: ConversationPageSlide()));
  }

  @override
  Widget build(BuildContext context) {
    var bkg = BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: [
          Palette.gradientStartColor,
          Palette.gradientEndColor,
        ],
      ),
    );
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            decoration: bkg,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (page) => updatePageState(page),
                    children: <Widget>[
                      buildPageOne(),
                      buildPageTwo(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 2; i++) CircleIndicator(i == currentPage),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: currentPage == 1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () => navigateToHome(),
                          elevation: 0,
                          backgroundColor: Palette.primaryColor,
                          child: Icon(
                            Icons.done,
                            color: Palette.accentColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updatePageState(int page) {
    if (page == 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      setState(() {
        currentPage = page;
      });
    }
  }

  buildPageOne() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Image.asset(
              Assets.appIconForeground,
              height: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "App Messager",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ButtonTheme(
              height: 40,
              child: FlatButton.icon(
                onPressed: () => updatePageState(1),
                icon: Image.asset(
                  Assets.googleButton,
                  height: 25,
                ),
                label: Text(
                  "Sign In with Goolge",
                  style: TextStyle(
                    color: Palette.primaryTextColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildPageTwo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            child: CircleAvatar(
              backgroundImage: Image.asset(Assets.user).image,
              radius: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 15,
                  ),
                  Text(
                    "Set Profile Picture",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "How old are you?",
            style: Styles.questionLight,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NumberPicker.horizontal(
                initialValue: age,
                minValue: 15,
                maxValue: 100,
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
              ),
              Text(
                "Years",
                style: Styles.textLight,
              )
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: Text(
              "Choose a username",
              style: Styles.questionLight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 120,
            child: TextField(
              textAlign: TextAlign.center,
              style: Styles.subHeadingLight,
              decoration: InputDecoration(
                hintStyle: Styles.hintTextLight,
                hintText: "@username",
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primaryColor, width: 0.1),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Palette.primaryColor, width: 0.1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
