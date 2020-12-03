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

import 'MyProfile.dart';
import 'SearchParticipants.dart';

class ModerationSettings extends StatefulWidget {

  ModerationSettings({Key key, this.auth, this.map, this.code}): super(key: key);

  final FirebaseAuth auth;
  final Map<dynamic, dynamic> map;
  final String code;

  @override
  State<StatefulWidget> createState() => _ModerationSettings();
}

class _ModerationSettings extends State<ModerationSettings> {

  FirebaseAuth auth;
  Map<dynamic, dynamic> map;
  String code;

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    map = widget.map;
    code = widget.code;

    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              onPressed: () async {
                FirebaseDatabase.instance
                    .reference()
                    .once()
                    .then((DataSnapshot snapshot) {
                  Map<dynamic, dynamic> map = snapshot.value;

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeFeed(
                                  auth: auth,
                                  code: widget.code,
                                  map: map)));
                  print(auth.currentUser.uid);
                });
              }
          ),

          title: Text("Moderation Settings"),
          backgroundColor: Color(0xff1A2677),

        )
    );
  }
}
