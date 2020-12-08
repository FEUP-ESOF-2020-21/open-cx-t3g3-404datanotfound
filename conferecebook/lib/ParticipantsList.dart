
import 'dart:collection';

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

import 'MyProfile1.dart';
import 'SearchParticipants.dart';

TextEditingController _textFieldController = TextEditingController();

class ParticipantsList extends StatefulWidget {
  ParticipantsList({Key key, this.auth, this.map, this.code, this.attendeeFilter, this.speakerFilter, this.sponsorFilter, this.organizerFilter}) : super(key: key);

  final FirebaseAuth auth;
  final Map<dynamic, dynamic> map;
  final String code;

  final bool attendeeFilter;
  final bool speakerFilter;
  final bool sponsorFilter;
  final bool organizerFilter;

  @override
  State<StatefulWidget> createState() => _ParticipantsList();
}

class _ParticipantsList extends State<ParticipantsList> {
  String searchToDo;

  FirebaseAuth auth;
  Map<dynamic, dynamic> map;
  String code;

  // intialize all the list to be present in ListView.Builder
  List<String> usersIDs = new List();
  List<String> usersImages = new List();
  List<String> usersNames = new List();
  List<String> usersJobs = new List();
  List<String> usersInterests = new List();
  List<String> usersCities = new List();
  List<String> usersBios = new List();
  List<String> usersAreas = new List();
  List<String> usersFacebooks = new List();
  List<String> usersInstagrams = new List();
  List<String> usersLinkedins = new List();
  List<String> usersTwitters = new List();
  List<String> usersGitHubs = new List();
  List<String> usersRoles = new List();
  Map<dynamic, dynamic> usersInConf;

  var users; // iterable class to be, which will save the usersUIDs in conference

  bool attendeeFilter;
  bool speakerFilter;
  bool sponsorFilter;
  bool organizerFilter;


  showTextAlertDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Who are you looking for?"),
              content: TextField(
                controller: _textFieldController,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Enter a name"),
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Search'),
                    onPressed: () async {
                      this.searchToDo = _textFieldController.text;
                      Navigator.of(context).pop();
                      print("Searching $this.searchToDo");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SearchParticipants(
                              auth: auth,
                              code: widget.code,
                              searchToDo: searchToDo,
                              map: map)));
                    })
              ]);
        });
  }

  @override
  void initState() {
    super.initState();
    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    this.attendeeFilter = widget.attendeeFilter;
    this.speakerFilter = widget.speakerFilter;
    this.sponsorFilter = widget.sponsorFilter;
    this.organizerFilter = widget.organizerFilter;

    int numConferences = map.values.toList()[0].length;

    String confName; // to save the value 'WS2020', 'WS2019', ...
    String confId; // to save the value 'id1', 'id2',...

    // get the conference we're in
    for (int i = 1; i <= numConferences; i++) {
      String aux = "id" + i.toString();
      confName = map.values.toList()[0][aux]["code"];
      if (confName == code) {
        confName = code;
        confId = aux;
      }
    }

    int numUsersInConference = map.values.toList()[0][confId]["users"].length;
    // get users of the conference we're in (iterable class)
    this.users = map.values.toList()[0][confId]["users"].keys;

    Map<String, String> mymap = new HashMap<String, String>();
    for (int i = 0; i < numUsersInConference; i++) {
      String user = users.elementAt(i);
      mymap[map.values.toList()[2][user]["name"]] = user;
    }

    Map<String, String> treeMap = new SplayTreeMap<String, String>.from(mymap);

    for (int i = 0; i < numUsersInConference; i++) {

      String user = treeMap.values.elementAt(i); // get user no. i

      // knowing the name of each user, save its properties in profile

      bool show = false;

      if (map.values.toList()[0][confId]["users"][user].toString() == "Attendee") {
        show = this.attendeeFilter;
      } else if (map.values.toList()[0][confId]["users"][user].toString() == "Sponsor") {
        show = this.sponsorFilter;
      } else if (map.values.toList()[0][confId]["users"][user].toString() == "Speaker") {
        show = this.speakerFilter;
      } else if (map.values.toList()[0][confId]["users"][user].toString() == "Organizer") {
        show = this.organizerFilter;
      }

      if (show) {
        usersIDs.add(user);
        usersImages.add(map.values.toList()[2][user]["photo"]);
        usersNames.add(map.values.toList()[2][user]["name"]);
        usersJobs.add(map.values.toList()[2][user]["job"]);
        usersInterests.add(map.values.toList()[2][user]["interests"]);
        usersCities.add(map.values.toList()[2][user]["city"]);
        usersBios.add(map.values.toList()[2][user]["bio"]);
        usersAreas.add(map.values.toList()[2][user]["area"]);
        usersFacebooks.add(map.values.toList()[2][user]["facebook"]);
        usersInstagrams.add(map.values.toList()[2][user]["instagram"]);
        usersLinkedins.add(map.values.toList()[2][user]["linkedin"]);
        usersTwitters.add(map.values.toList()[2][user]["twitter"]);
        usersGitHubs.add(map.values.toList()[2][user]["github"]);
        usersRoles.add(map.values.toList()[0][confId]["users"][user]);
      }
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
            title: Text("List of Participants"),
            backgroundColor: Color(0xff1A2677),
            actions: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.search, color: Colors.white),
                onPressed: () => showTextAlertDialog(context),
              ),
              IconButton(
                  icon: Icon(FontAwesomeIcons.list, color: Colors.white),
                  onPressed: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  })
            ]),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(),
              Text("Participants Filter", style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1A2677),
              ),
                textAlign: TextAlign.center,
              ),
              ListTile(),
              /*ListTile(
                leading: new Icon(
                  FontAwesomeIcons.userAlt,
                  color: const Color(0xff1A2677),
                ),
                title: Text("MyProfile"),
                onTap: () async {},
              ),*/
              CheckboxListTile(
                title: const Text('Show Attendees', style: TextStyle(color: const Color(0xff1A2677),),),
                activeColor: const Color(0xff1A2677),
                value: attendeeFilter,
                onChanged: (bool value) {
                  setState(() {
                    attendeeFilter = value;
                  });
                },
                secondary: const Icon(FontAwesomeIcons.users, color: const Color(0xff1A2677),),
              ),
              CheckboxListTile(
                title: const Text('Show Sponsors', style: TextStyle(color: const Color(0xff1A2677),),),
                activeColor: const Color(0xff1A2677),
                value: sponsorFilter,
                onChanged: (bool value) {
                  setState(() {
                    sponsorFilter = value;
                  });
                },
                secondary: const Icon(FontAwesomeIcons.building, color: const Color(0xff1A2677),),
              ),
              CheckboxListTile(
                title: const Text('Show Organizers', style: TextStyle(color: const Color(0xff1A2677),),),
                activeColor: const Color(0xff1A2677),
                value: organizerFilter,
                onChanged: (bool value) {
                  setState(() {
                    organizerFilter = value;
                  });
                },
                secondary: const Icon(FontAwesomeIcons.usersCog, color: const Color(0xff1A2677),),
              ),
              CheckboxListTile(
                title: const Text('Show Speakers', style: TextStyle(color: const Color(0xff1A2677),),),
                activeColor: const Color(0xff1A2677),
                value: speakerFilter,
                onChanged: (bool value) {
                  setState(() {
                    speakerFilter = value;
                  });
                },
                secondary: const Icon(FontAwesomeIcons.microphoneAlt, color: const Color(0xff1A2677),),
              ),
              ListTile(),
              Column(
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: const Color(0xff1A2677))),
                    onPressed: () async {
                      FirebaseDatabase.instance
                          .reference()
                          .once()
                          .then((DataSnapshot snapshot) {
                        Map<dynamic, dynamic> map = snapshot.value;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ParticipantsList(
                              auth: auth,
                              map: map,
                              code: code,
                              attendeeFilter: this.attendeeFilter,
                              sponsorFilter: this.sponsorFilter,
                              speakerFilter: this.speakerFilter,
                              organizerFilter: this.organizerFilter,
                            )));
                      });
                    },
                    color: const Color(0xff1A2677),
                    textColor: Colors.white,
                    child: Text("Filter".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),

            ],
          ),
        ),
        body: Stack(children: <Widget>[
          new ListView.builder(
              itemCount: usersIDs.length,
              itemBuilder: (BuildContext context, int index) {
                String userToSee = usersIDs[index];
                String image = usersImages[index];
                String name = usersNames[index];
                String job = usersJobs[index];
                String interests = usersInterests[index];
                String city = usersCities[index];
                String bio = usersBios[index];
                String area = usersAreas[index];
                String facebook = usersFacebooks[index];
                String instagram = usersInstagrams[index];
                String linkedin = usersLinkedins[index];
                String twitter = usersTwitters[index];
                String github = usersGitHubs[index];
                String role = usersRoles[index];

                return Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      child: new ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(image), radius: 22),
                          title: Text(name,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: const Color(0xff333333),
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(role,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: const Color(0xff111111))),
                          trailing: IconButton(
                              icon: Icon(FontAwesomeIcons.arrowRight,
                                  color: Color(0xff1A2677)),
                              onPressed: () async {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => ViewProfile1(
                                              auth: auth,
                                              userToSee: userToSee,
                                              // id of user pressed
                                              map: map,
                                              code: widget.code,
                                            )));
                              })),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      //elevation: 5,
                      margin: EdgeInsets.all(0),
                      color: const Color(0xfff5f5f5),
                    ));
              })
        ]));
  }
}
