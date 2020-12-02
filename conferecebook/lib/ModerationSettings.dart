import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/ViewProfile1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  bool postsFromSponsors = false;
  bool postsFromSpeakers = true;
  bool postsFromAttendees = true;

  int maxPostsFromSponsors = 3;
  int maxPostsFromSpeakers = 5;
  int maxPostsFromAttendees = 10;

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    map = widget.map;
    code = widget.code;


    myNumberInput(int maxPosts){
      return SpinBox(
        min: 0,
        max: 100,
        value: maxPosts.toDouble(),
        spacing: 1,
        direction: Axis.horizontal,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        textStyle: TextStyle(fontSize: 15),
        incrementIcon: Icon(FontAwesomeIcons.plus,
            size: 15,
            color: Color(0xff1A2677)),
        decrementIcon: Icon(FontAwesomeIcons.minus,
            size: 15,
            color: Color(0xff1A2677)),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Color(0xff1A2677)),
            borderRadius: BorderRadius.circular(150.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff1A2677),
                width: 2),
            borderRadius: BorderRadius.circular(150.0),
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          this.maxPostsFromAttendees = value.toInt();
        },
      );

    }

    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              onPressed: () async {
                print(maxPostsFromAttendees);
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

        ),

        body:
          ListView(
            padding: EdgeInsets.only(top:10),
            children: [
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: 'Exclusive for ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: "Organizers",
                            style: TextStyle(color: Color(0xff1A2677),
                            fontWeight: FontWeight.bold)),
                      ],
                    ),
              )),

              ListTile( // setting of ON or OFF for Sponsors
                title: Text("Posts from Sponsors"),
                trailing: Transform.scale(  // reduce default size of switch
                  scale: 0.9,
                  child: LiteRollingSwitch(
                    //initial value
                    value: postsFromSponsors,
                    textOn: 'Allowed',
                    textOff: 'No',
                    colorOn: Color(0xff1A2677),
                    colorOff: Colors.black54,
                    iconOn: Icons.done,
                    iconOff: Icons.lock,
                    textSize: 16.0,
                    onChanged: (bool state) {
                      //Use it to manage the different states
                      print('Current State of SWITCH IS: $state');
                    },
                  )
                ),
              ),

              ListTile( // setting of ON or OFF for Attendees
                title: Text("Posts from Attendees"),
                trailing: Transform.scale(  // reduce default size of switch
                    scale: 0.9,
                    child: LiteRollingSwitch(
                      //initial value
                      value: postsFromAttendees,
                      textOn: 'Allowed',
                      textOff: 'No',
                      colorOn: Color(0xff1A2677),
                      colorOff: Colors.black54,
                      iconOn: Icons.done,
                      iconOff: Icons.lock,
                      textSize: 16.0,
                      onChanged: (bool state) {
                        //Use it to manage the different states
                        print('Current State of SWITCH IS: $state');
                      },
                    )
                ),
              ),

              ListTile( // setting of ON or OFF for Speakers
                title: Text("Posts from Speakers"),
                trailing: Transform.scale(  // reduce default size of switch
                    scale: 0.9,
                    child: LiteRollingSwitch(
                      //initial value
                      value: postsFromSpeakers,
                      textOn: 'Allowed',
                      textOff: 'No',
                      colorOn: Color(0xff1A2677),
                      colorOff: Colors.black54,
                      iconOn: Icons.done,
                      iconOff: Icons.lock,
                      textSize: 16.0,
                      onChanged: (bool state) {
                        //Use it to manage the different states
                        print('Current State of SWITCH IS: $state');
                      },
                    )
                ),
              ),
              ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: "Number of Posts for ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: "Allowed Users",
                            style: TextStyle(color: Color(0xff1A2677),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                )),// to create some space between elements
              ListTile(
                title: Text("Limit for Sponsors"),
                trailing: Transform.scale(
                  alignment: Alignment.centerRight,
                  scale: 0.83,
                  child: Container(
                    width: 150,
                    height: 120,
                    padding: EdgeInsets.only(right: 5),
                    child: SpinBox(
                      min: 0,
                      max: 100,
                      value: maxPostsFromSponsors.toDouble(),
                      spacing: 1,
                      direction: Axis.horizontal,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      textStyle: TextStyle(fontSize: 15),
                      incrementIcon: Icon(FontAwesomeIcons.plus,
                          size: 15,
                          color: Color(0xff1A2677)),
                      decrementIcon: Icon(FontAwesomeIcons.minus,
                          size: 15,
                          color: Color(0xff1A2677)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color(0xff1A2677)),
                          borderRadius: BorderRadius.circular(150.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xff1A2677),
                              width: 2),
                          borderRadius: BorderRadius.circular(150.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        this.maxPostsFromSponsors = value.toInt();
                      },
                    )
                  )
                )
              ),
              ListTile(
                  title: Text("Limit for Speakers"),
                  trailing: Transform.scale(
                      alignment: Alignment.centerRight,
                      scale: 0.83,
                      child: Container(
                          width: 150,
                          height: 120,
                          padding: EdgeInsets.only(right: 5),
                          child: SpinBox(
                            min: 0,
                            max: 100,
                            value: maxPostsFromSpeakers.toDouble(),
                            spacing: 1,
                            direction: Axis.horizontal,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            textStyle: TextStyle(fontSize: 15),
                            incrementIcon: Icon(FontAwesomeIcons.plus,
                                size: 15,
                                color: Color(0xff1A2677)),
                            decrementIcon: Icon(FontAwesomeIcons.minus,
                                size: 15,
                                color: Color(0xff1A2677)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff1A2677)),
                                borderRadius: BorderRadius.circular(150.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1A2677),
                                    width: 2),
                                borderRadius: BorderRadius.circular(150.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              this.maxPostsFromSpeakers = value.toInt();
                            },
                          )
                      )
                  )
              ),
              ListTile(
                  title: Text("Limit for Attendees"),
                  trailing: Transform.scale(
                      alignment: Alignment.centerRight,
                      scale: 0.83,
                      child: Container(
                          width: 150,
                          height: 120,
                          padding: EdgeInsets.only(right: 5),
                          child: SpinBox(
                            min: 0,
                            max: 100,
                            value: maxPostsFromAttendees.toDouble(),
                            spacing: 1,
                            direction: Axis.horizontal,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            textStyle: TextStyle(fontSize: 15),
                            incrementIcon: Icon(FontAwesomeIcons.plus,
                                size: 15,
                                color: Color(0xff1A2677)),
                            decrementIcon: Icon(FontAwesomeIcons.minus,
                                size: 15,
                                color: Color(0xff1A2677)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff1A2677)),
                                borderRadius: BorderRadius.circular(150.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1A2677),
                                    width: 2),
                                borderRadius: BorderRadius.circular(150.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              this.maxPostsFromAttendees = value.toInt();
                            },
                          )
                      )
                  )
              ),

            ]
          ));
  }
}
