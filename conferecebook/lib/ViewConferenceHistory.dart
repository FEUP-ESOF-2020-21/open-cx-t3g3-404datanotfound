import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/ViewProfile1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import './CreateProfile1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/widgets.dart';
import './HomeFeed.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

import 'MyProfile1.dart';
import 'SearchParticipants.dart';

class ViewConferenceHistory extends StatefulWidget{

  ViewConferenceHistory({Key key, this.auth, this.userToSee, this.code, this.map}): super(key: key);

  final FirebaseAuth auth;
  String userToSee;
  final String code;
  final Map<dynamic, dynamic> map;

  @override
  _ViewConferenceHistoryState createState() => _ViewConferenceHistoryState();
}

class _ViewConferenceHistoryState extends State<ViewConferenceHistory>{

  String userToSee;
  String code;
  FirebaseAuth auth;
  Map<dynamic, dynamic> map;

  List<String> conferenceHistory=[];
  List<String> conferenceHistoryRole=[];
  bool showConferenceHistory;


  @override
  void initState() {
    super.initState();
    userToSee=widget.userToSee;
    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    showConferenceHistory=this.showConferenceHistory;

    showConferenceHistory=map.values.toList()[2][userToSee]["showConferenceHistory"];

    int numConferences = map.values.toList()[0].length;
    for(int i = 1; i <= numConferences; i++) {
      String aux = "id" + i.toString();
      int numUsersinConference=map.values.toList()[0][aux]["users"].length;
      dynamic users= map.values.toList()[0][aux]["users"].keys;
      for(int i = 0; i < numUsersinConference; i++) {
        if (users.elementAt(i) == widget.userToSee){
          conferenceHistory.add(map.values.toList()[0][aux]["name"]);
          print("Conference:");
          print(map.values.toList()[0][aux]["name"]);
          conferenceHistoryRole.add(map.values.toList()[0][aux]["users"][widget.userToSee]);
          print("Role:");
          print(map.values.toList()[0][aux]["users"][widget.userToSee]);
        }
      }

    }

  }



  @override
  Widget build(BuildContext context) {
    if (showConferenceHistory == true) {
      return WillPopScope(
          onWillPop: () async => false, child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewProfile1(
                              auth: auth,
                              userToSee: userToSee, // id of user pressed
                              map: map,
                              code: widget.code,)));
              }),


          title: Text("Conference History"),
          backgroundColor: Color(0xff1A2677),
        ),
        body:
        ListView(
            padding: EdgeInsets.only(top: 10),
            children: [
              ListView.builder(
                  padding: EdgeInsets.only(top: 15.0),
                  shrinkWrap: true,
                  itemCount: conferenceHistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    String conference = conferenceHistory[index];
                    String role = conferenceHistoryRole[index];

                    return Container(
                        padding: EdgeInsets.all(10),

                        child: Card(

                          child: new ListTile(
                            title: Text(conference, style: TextStyle(
                                fontSize: 17.0,
                                color: const Color(0xff333333),
                                fontWeight: FontWeight.bold
                            )
                            ),
                            subtitle: Text(role, style: TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xff111111)
                            )
                            ),

                          ),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          //elevation: 5,
                          margin: EdgeInsets.all(0),
                          color: const Color(0xfff5f5f5),
                        ));
                  }
              ),

            ]),


      ));
    }
    else{
      return WillPopScope(
          onWillPop: () async => false, child:Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewProfile1(
                              auth: auth,
                              userToSee: userToSee, // id of user pressed
                              map: map,
                              code: widget.code,)));
              }),


          title: Text("Conference History"),
          backgroundColor: Color(0xff1A2677),
        ),
        body:
        Container(
          alignment: Alignment.center,
          child: Text(
            map.values.toList()[2][userToSee]["name"]+"'s Conference History is currently occult!",
            style: TextStyle(color: const Color(0xff1A2677)),
            textDirection: TextDirection.ltr,
          ),
        )


      ));
    }
  }

}

