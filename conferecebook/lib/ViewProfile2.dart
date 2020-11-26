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
import 'package:flutter_tags/flutter_tags.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import './Search.dart';
import './NewPost.dart';
import './NotificationsPanel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import 'HomeFeed.dart';
import 'ViewProfile1.dart';

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

class ViewProfile2 extends StatefulWidget {
  ViewProfile2({
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
  State<StatefulWidget> createState() => _ViewProfile2();
}

class _ViewProfile2 extends State<ViewProfile2> {

  FirebaseAuth auth;
  String userToSee;
  Map<dynamic, dynamic> map;
  String image;
  String name;
  String city;
  String facebook;
  String instagram;
  String github;
  String linkedin;
  String twitter;
  String interests;
  List<String> myInterests;

  String code;

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  // Allows you to get a list of all the ItemTags
  _getAllItem() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if (lst != null)
      lst.where((a) => a.active == true).forEach((a) => print(a.title));
  }

  interestsToString() {
    if (myInterests.length != 0) interests = "";
    for (int i = 0; i < myInterests.length; i++) {
      interests += myInterests[i] + ",";
    }
  }

  showAlertDialog(BuildContext context, String text) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta;

    alerta = AlertDialog(
      title: Text("Oops..."),
      content: Text(name.trimRight() + " doesn't have a " + text + " account."),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    userToSee = widget.userToSee;
    auth = widget.auth;
    map = widget.map;
    image = map.values.toList()[2][userToSee]["photo"];
    name = map.values.toList()[2][userToSee]["name"];
    city = map.values.toList()[2][userToSee]["city"];
    facebook = map.values.toList()[2][userToSee]["facebook"];
    instagram = map.values.toList()[2][userToSee]["instagram"];
    github = map.values.toList()[2][userToSee]["github"];
    twitter = map.values.toList()[2][userToSee]["twitter"];
    linkedin = map.values.toList()[2][userToSee]["linkedin"];
    interests = map.values.toList()[2][userToSee]["interests"];
    myInterests = interests.split(',').toList();


    String code;

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
                    color: const Color(0xffeeeeee),
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
                    color: const Color(0xffeeeeee),
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
                offset: Offset(SizeConfig.screenWidth * 130,
                    SizeConfig.screenHeight * 350),
                child: Text(
                  'Social Media',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 150,
                    SizeConfig.screenHeight * 550),
                child: Text(
                  'Interests',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 80,
                      SizeConfig.screenHeight * 600),
                  child: Container(
                    width: SizeConfig.screenWidth * 250,
                    child: Tags(
                      key: _tagStateKey,
                      itemCount: myInterests.length, // required
                      itemBuilder: (int index) {
                        final item = myInterests[index];
                        return ItemTags(
                          // Each ItemTags must contain a Key. Keys allow Flutter to
                          // uniquely identify widgets.
                          key: Key(index.toString()),
                          index: index,
                          // required
                          title: item,
                          textStyle: TextStyle(
                            fontSize: 10,
                          ),
                          combine: ItemTagsCombine.withTextBefore,
                          image: null,
                          // OR null,
                          icon: null,
                          // OR null,
                          removeButton: null,
                          // OR null,
                          onPressed: (item) => print(item),
                          onLongPressed: (item) => print(item),
                        );
                      },
                    ),
                  )),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 200,
                    SizeConfig.screenHeight * 440.0),
                child: Container(
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.linkedin,
                            color: const Color(0xff1A2677)),
                        onPressed: () async {
                          if (this.linkedin == null)
                            showAlertDialog(context, "LinkedIn");
                          else {
                            String url =
                                'https://linkedin.com/in/' + this.linkedin;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        })),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 220,
                    SizeConfig.screenHeight * 380.0),
                child: Container(
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.twitter,
                            color: const Color(0xff1A2677)),
                        onPressed: () async {
                          if (this.twitter == null)
                            showAlertDialog(context, "Twitter");
                          else {
                            String url = 'https://twitter.com/' + this.twitter;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        })),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 150,
                    SizeConfig.screenHeight * 440.0),
                child: Container(
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.github,
                            color: const Color(0xff1A2677)),
                        onPressed: () async {
                          if (this.github == null)
                            showAlertDialog(context, "Github");
                          else {
                            String url = 'https://github.com/' + this.github;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        })),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 170,
                    SizeConfig.screenHeight * 380.0),
                child: Container(
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.instagram,
                            color: const Color(0xff1A2677)),
                        onPressed: () async {
                          if (this.instagram == null)
                            showAlertDialog(context, "Instagram");
                          else {
                            String url =
                                'https://instagram.com/' + this.instagram;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        })),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 120,
                    SizeConfig.screenHeight * 380.0),
                child: Container(
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.facebook,
                            color: const Color(0xff1A2677)),
                        onPressed: () async {
                          if (this.facebook == null)
                            showAlertDialog(context, "Facebook");
                          else {
                            String url =
                                'https://facebook.com/' + this.facebook;

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        })),
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
                            alignment: FractionalOffset.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 75.0, left: 35.0),
                              child: FloatingActionButton(
                                onPressed: () async {
                                  interestsToString();
                                  FirebaseDatabase.instance
                                      .reference()
                                      .child('Users')
                                      .child(widget.auth.currentUser.uid)
                                      .update({interests: interests}).then((value) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => ViewProfile1(
                                                auth: widget.auth,
                                                userToSee: userToSee,
                                                map: map,
                                                code: widget.code)));
                                  });
                                },
                                backgroundColor: const Color(0xffdddddd),
                                elevation: 0,
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
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
                                      builder: (context) => ViewProfile1(
                                          auth: widget.auth,
                                          userToSee: userToSee,
                                          code: widget.code,
                                          map: map
                                      )));
                            });
                          }, // button pressed
                          child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,), // icon

                        ),
                      ),
                    ),
                  )),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 340 , SizeConfig.screenHeight * 20 + 20),
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
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeFeed(
                                          auth: widget.auth,
                                          code: widget.code,
                                          map: map
                                      )));
                              print("hello");
                              print(code);
                              print(map);
                            });
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.home,
                            color: Colors.white,
                          ), // icon
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
    }
  }