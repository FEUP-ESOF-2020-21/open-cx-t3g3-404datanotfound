import 'package:ConfereceBook/EnterEventCode.dart';
import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:ConfereceBook/MyProfile.dart';
import 'package:ConfereceBook/Post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/rendering.dart';
import 'package:ConfereceBook/ParticipantsList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import 'HomeFeed.dart';
import 'ViewProfile2.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width / 412;
    screenHeight = _mediaQueryData.size.height / 870;
  }
}

class ViewProfile1 extends StatefulWidget {
  ViewProfile1({
    Key key,
    this.auth,
    this.userToSee,
    this.map,
    this.code
  }) : super(key: key);

  final FirebaseAuth auth;
  final String userToSee;
  final Map<dynamic, dynamic> map;
  final String code;


  @override
  State<StatefulWidget> createState() => _ViewProfile1();
}

class _ViewProfile1 extends State<ViewProfile1> {

  FirebaseAuth auth;
  String userToSee;
  String code;
  Map<dynamic, dynamic> map;
  String image;
  String name;
  String job;
  String city;
  String bio;
  String area;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    userToSee = widget.userToSee;
    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    print(code);
    image = map.values.toList()[2][userToSee]["photo"];
    name = map.values.toList()[2][userToSee]["name"];
    city = map.values.toList()[2][userToSee]["city"];
    bio = map.values.toList()[2][userToSee]["bio"];
    job = map.values.toList()[2][userToSee]["job"];
    area = map.values.toList()[2][userToSee]["area"];


    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          backgroundColor: const Color(0xffffffff),
          body: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 34.0,
                    SizeConfig.screenHeight * 150.0),
                child: Container(
                  width: SizeConfig.screenWidth * 345.0,
                  height: SizeConfig.screenHeight * 636.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color(0x80ececec),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 110.0,
                    SizeConfig.screenHeight * 64.0),
                child: Container(
                  width: SizeConfig.screenWidth * 194.0,
                  height: SizeConfig.screenHeight * 194.0,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0xfff5f5f5),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 158.5,
                    SizeConfig.screenHeight * 290.0),
                child: SizedBox(
                  width: SizeConfig.screenWidth * 100.0,
                  child: Text(
                    this.city,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: const Color(0xff1A2677),
                      letterSpacing: 0.1875,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 430),
                child: Container(
                    child: Text(
                      bio,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 376.5),
                child: Text(
                  'Bio',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 530),
                child: Container(
                    child: Text(
                      job,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 476.5),
                child: Text(
                  'Job',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 630),
                child: Container(
                    child: Text(
                      area,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 576.5),
                child: Text(
                  'Area',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 80,
                    SizeConfig.screenHeight * 250.0),
                child: SizedBox(
                  width: 226.0,
                  child: Text(
                    this.name,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      color: const Color(0xff1A2677),
                      letterSpacing: 0.28125,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 150,
                    SizeConfig.screenHeight * 100.0),
                child:
                // Adobe XD layer: 'NoPath' (shape)
                Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(this.image),
                    radius: 50,
                  ),
                ),
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 75.0, right: 35.0),
                              child: FloatingActionButton(
                                onPressed: () async {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => ViewProfile2(
                                              auth: auth,
                                              userToSee: userToSee,
                                              map: this.map,
                                              code: this.code,
                                              )));
                                  print(code);
                                },
                                backgroundColor: const Color(0xffededed),
                                elevation: 0,
                                child: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: const Color(0xff1A2677),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  )),
              Transform.translate(
                  offset: Offset(
                      SizeConfig.screenWidth * 10, SizeConfig.screenHeight * 20 + 20),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xff1A2677), // button color
                        child: InkWell(
                          splashColor: const Color(0xff1A2677), // splash color
                          onTap: () async {
                            FirebaseDatabase.instance
                                .reference()
                                .once()
                                .then((DataSnapshot snapshot) {
                              Map<dynamic, dynamic> map = snapshot.value;
                              print(code);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => ParticipantsList(
                                          auth: widget.auth,
                                          code: widget.code,
                                          map: map
                                      )));
                                });
                          }, // button pressed
                          child: Icon(FontAwesomeIcons.users, color: Colors.white,), // icon

                        ),
                      ),
                    ),
                  )),
              Transform.translate(
                  offset: Offset(
                      SizeConfig.screenWidth * 340 , SizeConfig.screenHeight * 20 + 20),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xff1A2677), // button color
                        child: InkWell(
                          splashColor: const Color(0xff1A2677), // splash color
                          onTap: () async {
                            FirebaseDatabase.instance
                                .reference()
                                .once()
                                .then((DataSnapshot snapshot) {
                              Map<dynamic, dynamic> map = snapshot.value;
                              print(code);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeFeed(
                                          auth: widget.auth,
                                          code: widget.code,
                                          map: map
                                      )));
                            });
                          }, // button pressed
                          child: Icon(FontAwesomeIcons.home, color: Colors.white,), // icon

                        ),
                      ),
                    ),
                  )),

            ],
          ),
        ));
  }

  }

