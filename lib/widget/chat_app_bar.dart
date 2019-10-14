import 'package:flutter/material.dart';
import 'package:messaging_app/config/assets.dart';
import 'package:messaging_app/config/palette.dart';
import 'package:messaging_app/config/styles.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;

  const ChatAppBar();

  @override
  Widget build(BuildContext context) {
    var textHeading = TextStyle(
      color: Palette.primaryTextColor,
      fontSize: 20,
    );
    var textStyle = TextStyle(
      color: Palette.secondaryTextColor,
    );

//    var width = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 0.1,
          )
        ]),
        child: Container(
          color: Palette.primaryBackgroundColor,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Icon(
                                    Icons.attach_file,
                                    color: Palette.secondaryColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "Hai Bui",
                                        style: Styles.textHeading,
                                      ),
                                      Text(
                                        "@gmail.com",
                                        style: Styles.text,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 23,
                          padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Photo",
                                style: Styles.text,
                              ),
                              VerticalDivider(
                                width: 30,
                                color: Palette.primaryTextColor,
                              ),
                              Text(
                                "Videos",
                                style: Styles.text,
                              ),
                              VerticalDivider(
                                width: 30,
                                color: Palette.primaryTextColor,
                              ),
                              Text(
                                "Files",
                                style: Styles.text,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.asset(
                        Assets.user,
                      ).image,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }
}
