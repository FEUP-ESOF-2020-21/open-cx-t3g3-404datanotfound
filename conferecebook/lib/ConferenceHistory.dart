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

class ConferenceHistory extends StatefulWidget {
  ConferenceHistory(
      {Key key,
      this.auth,
      this.image,
      this.name,
      this.job,
      this.interests,
      this.city,
      this.bio,
      this.area,
      this.facebook,
      this.instagram,
      this.linkedin,
      this.twitter,
      this.github,
      this.code,
      this.map})
      : super(key: key);

  final FirebaseAuth auth;
  final String image;
  final String name;
  final String job;
  final String interests;
  final String city;
  final String bio;
  final String area;
  final String facebook;
  final String instagram;
  final String linkedin;
  final String twitter;
  final String github;
  final String code;
  final Map<dynamic, dynamic> map;

  //final Map<dynamic, dynamic> map;

  @override
  _ConferenceHistoryState createState() => _ConferenceHistoryState();
}

class _ConferenceHistoryState extends State<ConferenceHistory> {
  String image;
  String name;
  String job;
  String interests;
  String city;
  String bio;
  String area;
  String facebook;
  String instagram;
  String linkedin;
  String twitter;
  String github;
  String code;
  FirebaseAuth auth;
  Map<dynamic, dynamic> map;

  List<String> conferenceHistory = [];
  List<String> conferenceHistoryRole = [];
  bool showConferenceHistory;

  @override
  void initState() {
    super.initState();

    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    image = widget.image;
    name = widget.name;
    job = widget.job;
    interests = widget.interests;
    city = widget.city;
    bio = widget.bio;
    area = widget.area;
    facebook = widget.facebook;
    instagram = widget.instagram;
    linkedin = widget.linkedin;
    twitter = widget.twitter;
    github = widget.github;
    showConferenceHistory = this.showConferenceHistory;

    showConferenceHistory =
        map.values.toList()[2][auth.currentUser.uid]["showConferenceHistory"];

    int numConferences = map.values.toList()[0].length;
    for (int i = 1; i <= numConferences; i++) {
      String aux = "id" + i.toString();
      int numUsersinConference = map.values.toList()[0][aux]["users"].length;
      dynamic users = map.values.toList()[0][aux]["users"].keys;
      for (int i = 0; i < numUsersinConference; i++) {
        if (users.elementAt(i) == widget.auth.currentUser.uid) {
          conferenceHistory.add(map.values.toList()[0][aux]["name"]);
          conferenceHistoryRole.add(map.values.toList()[0][aux]["users"]
              [widget.auth.currentUser.uid]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference firebaseDatabaseRef = FirebaseDatabase.instance
        .reference()
        .child('Users')
        .child(widget.auth.currentUser.uid);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                onPressed: () async {
                  FirebaseDatabase.instance
                      .reference()
                      .once()
                      .then((DataSnapshot snapshot) {
                    Map<dynamic, dynamic> map = snapshot.value;
                    String user = auth.currentUser.uid;
                    this.image = map.values.toList()[2][user]["photo"];
                    this.name = map.values.toList()[2][user]["name"];
                    this.job = map.values.toList()[2][user]["job"];
                    this.interests = map.values.toList()[2][user]["interests"];
                    this.city = map.values.toList()[2][user]["city"];
                    this.bio = map.values.toList()[2][user]["bio"];
                    this.area = map.values.toList()[2][user]["area"];
                    this.linkedin = map.values.toList()[2][user]["linkedin"];
                    this.facebook = map.values.toList()[2][user]["facebook"];
                    this.instagram = map.values.toList()[2][user]["instagram"];
                    this.twitter = map.values.toList()[2][user]["twitter"];
                    this.github = map.values.toList()[2][user]["github"];
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MyProfile1(
                            auth: widget.auth,
                            image: image,
                            name: name,
                            job: job,
                            interests: interests,
                            city: city,
                            bio: bio,
                            area: area,
                            linkedin: linkedin,
                            facebook: facebook,
                            instagram: instagram,
                            twitter: twitter,
                            github: github,
                            code: widget.code)));
                  });
                }),
            title: Text("Conference History"),
            backgroundColor: Color(0xff1A2677),
          ),
          body: ListView(padding: EdgeInsets.only(top: 10), children: [
            ListTile(
              // setting of ON or OFF for Sponsors
              title: Text("Show Conference History"),
              trailing: Transform.scale(
                  // reduce default size of switch
                  scale: 0.9,
                  child: LiteRollingSwitch(
                    //initial value
                    value: this.showConferenceHistory,
                    textOn: 'Allowed',
                    textOff: 'No',
                    colorOn: Color(0xff1A2677),
                    colorOff: Colors.black54,
                    iconOn: Icons.done,
                    iconOff: Icons.lock,
                    textSize: 16.0,
                    onChanged: (bool state) {
                      this.showConferenceHistory = state;
                      firebaseDatabaseRef
                          .child("showConferenceHistory")
                          .set(this.showConferenceHistory);
                    },
                  )),
            ),
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
                          title: Text(conference,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: const Color(0xff333333),
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(role,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: const Color(0xff111111))),
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
                }),
          ]),
        ));
  }
}
