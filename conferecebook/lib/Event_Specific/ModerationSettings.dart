import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../Feed/HomeFeed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class ModerationSettings extends StatefulWidget {
  ModerationSettings({Key key, this.auth, this.map, this.confId, this.code})
      : super(key: key);

  final FirebaseAuth auth;
  final Map<dynamic, dynamic> map;
  final String code;
  final String confId;

  @override
  State<StatefulWidget> createState() => _ModerationSettings();
}

class _ModerationSettings extends State<ModerationSettings> {
  FirebaseAuth auth;
  Map<dynamic, dynamic> map;
  String code;
  String confId;

  bool postsFromSponsors;
  bool postsFromSpeakers;
  bool postsFromAttendees;

  int maxPostsFromSponsors;
  int maxPostsFromSpeakers;
  int maxPostsFromAttendees;

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    confId = widget.confId;

    postsFromSponsors =
        map.values.toList()[0][confId]["postsControl"]["postsFromSponsors"];
    postsFromSpeakers =
        map.values.toList()[0][confId]["postsControl"]["postsFromSpeakers"];
    postsFromAttendees =
        map.values.toList()[0][confId]["postsControl"]["postsFromAttendees"];
    maxPostsFromSponsors =
        map.values.toList()[0][confId]["postsControl"]["maxPostsFromSponsors"];
    maxPostsFromSpeakers =
        map.values.toList()[0][confId]["postsControl"]["maxPostsFromSpeakers"];
    maxPostsFromAttendees =
        map.values.toList()[0][confId]["postsControl"]["maxPostsFromAttendees"];

    DatabaseReference firebaseDatabaseRef = FirebaseDatabase.instance
        .reference()
        .child('Conferences')
        .child(confId);

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

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          HomeFeed(auth: auth, code: widget.code, map: map)));
                });
              }),
          title: Text("Moderation Settings"),
          backgroundColor: Color(0xff1A2677),
        ),
        body: ListView(padding: EdgeInsets.only(top: 10), children: [
          ListTile(
              title: RichText(
            text: TextSpan(
              text: 'Exclusive for ',
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: "Organizers",
                    style: TextStyle(
                        color: Color(0xff1A2677), fontWeight: FontWeight.bold)),
              ],
            ),
          )),
          ListTile(
            // setting of ON or OFF for Sponsors
            title: Text("Posts from Sponsors"),
            trailing: Transform.scale(
                // reduce default size of switch
                scale: 0.9,
                child: LiteRollingSwitch(
                  //initial value
                  value: postsFromSponsors,
                  textOn: 'Allowed',
                  textOff: 'Blocked',
                  colorOn: Color(0xff1A2677),
                  colorOff: Colors.black54,
                  iconOn: Icons.done,
                  iconOff: Icons.lock,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    this.postsFromSponsors = state;
                    firebaseDatabaseRef
                        .child("postsControl")
                        .child("postsFromSponsors")
                        .set(this.postsFromSponsors);
                  },
                )),
          ),
          ListTile(
            // setting of ON or OFF for Speakers
            title: Text("Posts from Speakers"),
            trailing: Transform.scale(
                // reduce default size of switch
                scale: 0.9,
                child: LiteRollingSwitch(
                  //initial value
                  value: postsFromSpeakers,
                  textOn: 'Allowed',
                  textOff: 'Blocked',
                  colorOn: Color(0xff1A2677),
                  colorOff: Colors.black54,
                  iconOn: Icons.done,
                  iconOff: Icons.lock,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    this.postsFromSpeakers = state;
                    firebaseDatabaseRef
                        .child("postsControl")
                        .child("postsFromSpeakers")
                        .set(this.postsFromSpeakers);
                  },
                )),
          ),
          ListTile(
            // setting of ON or OFF for Attendees
            title: Text("Posts from Attendees"),
            trailing: Transform.scale(
                // reduce default size of switch
                scale: 0.9,
                child: LiteRollingSwitch(
                  //initial value
                  value: postsFromAttendees,
                  textOn: 'Allowed',
                  textOff: 'Blocked',
                  colorOn: Color(0xff1A2677),
                  colorOff: Colors.black54,
                  iconOn: Icons.done,
                  iconOff: Icons.lock,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    this.postsFromAttendees = state;
                    firebaseDatabaseRef
                        .child("postsControl")
                        .child("postsFromAttendees")
                        .set(this.postsFromAttendees);
                  },
                )),
          ),
          ListTile(
              title: RichText(
            text: TextSpan(
              text: "Number of Posts for ",
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: "Allowed Users",
                    style: TextStyle(
                        color: Color(0xff1A2677), fontWeight: FontWeight.bold)),
              ],
            ),
          )),
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
                            size: 15, color: Color(0xff1A2677)),
                        decrementIcon: Icon(FontAwesomeIcons.minus,
                            size: 15, color: Color(0xff1A2677)),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff1A2677)),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff1A2677), width: 2),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          this.maxPostsFromSponsors = value.toInt();
                          firebaseDatabaseRef
                              .child("postsControl")
                              .child("maxPostsFromSponsors")
                              .set(this.maxPostsFromSponsors);
                        },
                      )))),
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
                            size: 15, color: Color(0xff1A2677)),
                        decrementIcon: Icon(FontAwesomeIcons.minus,
                            size: 15, color: Color(0xff1A2677)),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff1A2677)),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff1A2677), width: 2),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          this.maxPostsFromSpeakers = value.toInt();
                          firebaseDatabaseRef
                              .child("postsControl")
                              .child("maxPostsFromSpeakers")
                              .set(this.maxPostsFromSpeakers);
                        },
                      )))),
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
                            size: 15, color: Color(0xff1A2677)),
                        decrementIcon: Icon(FontAwesomeIcons.minus,
                            size: 15, color: Color(0xff1A2677)),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff1A2677)),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff1A2677), width: 2),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          this.maxPostsFromAttendees = value.toInt();
                          firebaseDatabaseRef
                              .child("postsControl")
                              .child("maxPostsFromAttendees")
                              .set(this.maxPostsFromAttendees);
                        },
                      )))),
        ]));
  }
}
