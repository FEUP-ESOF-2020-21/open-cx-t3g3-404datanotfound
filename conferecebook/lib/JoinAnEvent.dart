import 'package:ConfereceBook/EnterEventCode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ConfereceBook/HomeFeed.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'Login.dart';

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

class JoinAnEvent extends StatefulWidget {
  JoinAnEvent({
    Key key,
    this.auth,
    this.map,
    this.userRole
  }) : super(key: key);

  final FirebaseAuth auth;
  final Map<dynamic, dynamic> map;
  final String userRole;

  @override
  State<StatefulWidget> createState() => _JoinAnEvent();

}

class _JoinAnEvent extends State<JoinAnEvent> {

  FirebaseAuth auth;
  String code;
  String nameEvent;
  String userRole;
  String confId;
  Map<dynamic, dynamic> map;
  // lists of names and codes to be shown in this page
  List<String> conferenceNames = new List();
  List<String> conferenceCodes = new List();
  List<String> conferenceRoles = new List();
  List<String> conferenceIDs = new List();

  @override
  void initState() {
    super.initState();
    map = widget.map;
    auth = widget.auth;
    int length = map.values.toList()[0].length;

    for (int i = 1; i <= length; i++) {
      String aux = "id" + i.toString();
      Map<dynamic, dynamic> conf = map.values.toList()[0][aux]; // current conference
      String nameConf = conf["name"];  // name of conference i
      String codeConf = conf["code"]; // code of conference i
      conferenceIDs.add(aux);

      if (conf["users"] != null) {
        String user = conf["users"][widget.auth.currentUser.uid];
        String userRole = conf["users"][widget.auth.currentUser.uid];
        if (user != null) {
          conferenceNames.add(nameConf); // append to list all conference names
          conferenceCodes.add(codeConf); // append to list all conference codes
          conferenceRoles.add(userRole); // append to list all roles
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (conferenceNames.isEmpty) {
    return WillPopScope(
    onWillPop: () async => false, child: Scaffold(
      backgroundColor: const Color(0xff1a2677),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight *  0),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.times, color: Colors.white,),
                    Text("\n Ups! You don't have any active \n conference. Why don't you join one?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                  ],
                )
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 133.0, SizeConfig.screenHeight *587.0),
            child: SizedBox(
              width: SizeConfig.screenWidth * 149.0,
              height: SizeConfig.screenHeight * 57.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                    size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight *57.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                          size: Size(SizeConfig.screenWidth * 149.0,SizeConfig.screenHeight * 57.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: SizeConfig.screenWidth * 1.0, color: const Color(0xff1a2677)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(SizeConfig.screenWidth * 26.5, SizeConfig.screenHeight * 15.5, SizeConfig.screenWidth * 96.0, SizeConfig.screenHeight * 26.0),
                    size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight *57.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => EnterEventCode(auth: auth,),
                      ),
                    ], child: Text(
                      'New Event',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17.2,
                        color: const Color(0xff1a2677),
                        letterSpacing: 0.1875,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),)
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 64.5,SizeConfig.screenHeight * 145.5),
            child: Text(
              'Join one event now!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 50,
                color: const Color(0xffffffff),
                letterSpacing: 0.54375,
                height: SizeConfig.screenHeight * 1.0344827586206897,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 135.0,SizeConfig.screenHeight * 829.0),
            child: SizedBox(
              width: SizeConfig.screenWidth * 144.0,
              child: Text(
                'ConferenceBook',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.15,
                  height:SizeConfig.screenHeight * 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ));
    } else {
      return WillPopScope(
          onWillPop: () async => false, child: Scaffold(
        backgroundColor: const Color(0xff1a2677),
        body: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight *  250.0),
              child: ListView.builder(
                itemCount: conferenceNames.length,
                itemBuilder: (context, position) {
                  code = conferenceNames[position];
                  nameEvent = conferenceCodes[position];
                  userRole = conferenceRoles[position];

                  return Container(
                    child: Card(
                      child: new ListTile(
                        trailing: IconButton(icon: new Icon(FontAwesomeIcons.times, color: const Color(0xffffffff),), onPressed: () {
                          FirebaseDatabase.instance // delete from Firebase
                              .reference()
                              .child("Conferences")
                              .child(conferenceIDs[position])
                              .child("users")
                              .child(auth.currentUser.uid)
                              .remove();

                          FirebaseDatabase.instance // update the map and rebuild
                              .reference()
                              .once()
                              .then((DataSnapshot snapshot) {
                            Map<dynamic, dynamic> map = snapshot.value;
                            String image = map.values.toList()[2][auth.currentUser.uid]["photo"];
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    JoinAnEvent(
                                      auth: this.auth,
                                      map: map,
                                    )));
                          });

                        }),

                        title: Text(code, style: TextStyle(fontSize: 17.0, color: const Color(0xffffffff), fontWeight: FontWeight.bold),),
                        subtitle: Text('You are $userRole', style: TextStyle(fontSize: 10.0, color: const Color(0xffffffff), fontWeight: FontWeight.bold),),
                        onTap: (){
                          FirebaseDatabase.instance
                              .reference()
                              .once()
                              .then((DataSnapshot snapshot) {
                            Map<dynamic, dynamic> map = snapshot.value;
                            String image = map.values.toList()[2][auth.currentUser.uid]["photo"];
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    HomeFeed(
                                      auth: this.auth,
                                      code: conferenceCodes[position],
                                      map: map,
                                    )));
                          });
                        },
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      color: const Color(0xff1a2677),
                    ),
                  );
                },
              ),

            ),
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 133.0, SizeConfig.screenHeight *587.0),
              child: SizedBox(
                width: SizeConfig.screenWidth * 149.0,
                height: SizeConfig.screenHeight * 57.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                      size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight *57.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                            size: Size(SizeConfig.screenWidth * 149.0,SizeConfig.screenHeight * 57.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: SizeConfig.screenWidth * 1.0, color: const Color(0xff1a2677)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromSize(
                        bounds: Rect.fromLTWH(SizeConfig.screenWidth * 26.5, SizeConfig.screenHeight * 15.5, SizeConfig.screenWidth * 96.0, SizeConfig.screenHeight * 26.0),
                        size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight *57.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              pageBuilder: () => EnterEventCode(auth: auth,),
                            ),
                          ], child: Text(
                          'New Event',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 17.2,
                            color: const Color(0xff1a2677),
                            letterSpacing: 0.1875,
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),)
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 64.5,SizeConfig.screenHeight * 145.5),
              child: Text(
                'Join one event now!',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 50,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.54375,
                  height: SizeConfig.screenHeight * 1.0344827586206897,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 135.0,SizeConfig.screenHeight * 829.0),
              child: SizedBox(
                width: SizeConfig.screenWidth * 144.0,
                child: Text(
                  'ConferenceBook',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: const Color(0xffffffff),
                    letterSpacing: 0.15,
                    height:SizeConfig.screenHeight * 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(),
          ],
        ),
      ));
    }
  }
}

const String _svg_pybriv =
    '<svg viewBox="-1.0 0.0 413.0 870.0" ><path transform="translate(-1.0, 0.0)" d="M 0 0 L 413.0000305175781 0 L 413.0000305175781 870 L 0 870 L 0 0 Z" fill="#1a2677" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g7k8u0 =
    '<svg viewBox="0.0 0.0 25.0 25.0" ><path  d="M 0 0 L 25 0 L 25 25 L 0 25 L 0 0 Z" fill="none" fill-opacity="0.7" stroke="none" stroke-width="1" stroke-opacity="0.7" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9fxlix =
    '<svg viewBox="5.2 3.1 14.6 18.8" ><path transform="translate(0.21, 0.13)" d="M 6.041666984558105 19.66666793823242 C 6.041666984558105 20.8125 6.979167461395264 21.75 8.125 21.75 L 16.45833396911621 21.75 C 17.60416793823242 21.75 18.54166793823242 20.8125 18.54166793823242 19.66666793823242 L 18.54166793823242 7.166666984558105 L 6.041666984558105 7.166666984558105 L 6.041666984558105 19.66666793823242 Z M 19.58333396911621 4.041666984558105 L 15.93750190734863 4.041666984558105 L 14.89583396911621 3 L 9.6875 3 L 8.645833015441895 4.041666984558105 L 5.000000476837158 4.041666984558105 L 5.000000476837158 6.125 L 19.58333396911621 6.125 L 19.58333396911621 4.041666984558105 Z" fill="#ffffff" fill-opacity="0.7" stroke="none" stroke-width="1" stroke-opacity="0.7" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bin63t =
    '<svg viewBox="0.0 0.0 25.0 25.0" ><path  d="M 0 0 L 25 0 L 25 25 L 0 25 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
