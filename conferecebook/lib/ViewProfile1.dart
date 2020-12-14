import 'package:ConfereceBook/EnterEventCode.dart';
import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:ConfereceBook/MyProfile1.dart';
import 'package:ConfereceBook/Post.dart';
import 'package:ConfereceBook/ViewConferenceHistory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
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
    this.code,
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

  showTextDialog(BuildContext context, String text, String title) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Back'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    userToSee = widget.userToSee;
    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    image = map.values.toList()[2][userToSee]["photo"];
    name = map.values.toList()[2][userToSee]["name"];
    city = map.values.toList()[2][userToSee]["city"];
    bio = map.values.toList()[2][userToSee]["bio"];
    job = map.values.toList()[2][userToSee]["job"];
    area = map.values.toList()[2][userToSee]["area"];

    return Scaffold(
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
                    this.city.trimRight().isEmpty
                        ? 'Undefined city'
                        : this.city,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: this.city.trimRight().isEmpty
                          ? const Color(0xffd3d3d3)
                          : const Color(0xff1A2677)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 430),
                child: Container(
                    width: 200,
                    height: 20,
                    child: Text(
                      bio.trimRight().isEmpty ? 'Undefined bio' : bio,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: bio.trimRight().isEmpty
                              ? const Color(0xffd3d3d3)
                              : const Color(0xff1A2677)),
                    )),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 300,
                      SizeConfig.screenHeight * 430),
                  child: Container(
                      width: 190,
                      height: 20,
                      child: bio.length > 28
                          ? RichText(
                              text: TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'See More',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showTextDialog(
                                              context, bio, "Biography");
                                        }),
                                ],
                              ),
                            )
                          : Container())),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 376.5),
                child: Text(
                  'Biography',
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
                    width: 200,
                    height: 20,
                    child: Text(
                      job.trimRight().isEmpty ? 'Undefined job' : job,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, color: job.trimRight().isEmpty
                          ? const Color(0xffd3d3d3)
                          : const Color(0xff1A2677)),
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
                    width: 200,
                    height: 20,
                    child: Text(
                      area.trimRight().isEmpty ? 'Undefined area' : area,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: area.trimRight().isEmpty
                              ? const Color(0xffd3d3d3)
                              : const Color(0xff1A2677)),
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
                  offset: Offset(SizeConfig.screenWidth * 300,
                      SizeConfig.screenHeight * 630),
                  child: Container(
                      width: 190,
                      height: 20,
                      child: area.length > 28
                          ? RichText(
                              text: TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'See More',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showTextDialog(context, area, "Area");
                                        }),
                                ],
                              ),
                            )
                          : Container())),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 300,
                      SizeConfig.screenHeight * 530),
                  child: Container(
                      width: 190,
                      height: 20,
                      child: job.length > 28
                          ? RichText(
                              text: TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'See More',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showTextDialog(context, job, "Job");
                                        }),
                                ],
                              ),
                            )
                          : Container())),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 80,
                    SizeConfig.screenHeight * 250.0),
                child: SizedBox(
                  width: 226.0,
                  child: Text(
                    this.name,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: this.name.length > 10 ? 20 : 30,
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
                            heroTag: "btn1",
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ViewProfile2(
                                            auth: auth,
                                            userToSee: userToSee,
                                            map: this.map,
                                            code: this.code,
                                          )));
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
                  ),
                ],
              )),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 10,
                      SizeConfig.screenHeight * 20 + 20),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xff1A2677), // button color
                        child: InkWell(
                          splashColor: const Color(0xff1A2677), // splash color
                          onTap: () async {
                            Navigator.of(context).pop();
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                          ), // icon
                        ),
                      ),
                    ),
                  )),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 43,
                      SizeConfig.screenHeight * 705),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xffededed), // button color
                        child: InkWell(
                          splashColor: const Color(0xffededed), // splash color
                          onTap: () async {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => ViewConferenceHistory(
                                          auth: auth,
                                          userToSee: userToSee,
                                          code: code,
                                          map: map,
                                        )));
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.history,
                            color: const Color(0xff1A2677),
                          ), // icon
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        );
  }
}
