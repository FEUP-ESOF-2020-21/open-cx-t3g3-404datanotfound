import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/ParticipantsList.dart';
import 'package:ConfereceBook/ViewProfile1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './CreateProfile1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/widgets.dart';
import './HomeFeed.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:flutter_search_bar/flutter_search_bar.dart';


import 'MyProfile.dart';

class SearchParticipants extends StatefulWidget {

  SearchParticipants({
    Key key,
    this.auth,
    this.map,
    this.searchToDo,
    this.code}): super(key: key);

  final FirebaseAuth auth;
  final String searchToDo;
  final Map<dynamic, dynamic> map;
  final String code;

  @override
  State<StatefulWidget> createState() => _SearchParticipants();
}

class _SearchParticipants extends State<SearchParticipants> {

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

  var users; // iterable class to be, which will save the usersUIDs in conference

  //String image = map.values.toList()[2][auth.currentUser.uid]["photo"];

  @override
  void initState() {
    super.initState();
    auth = widget.auth;
    map = widget.map;
    code = widget.code;
    searchToDo = widget.searchToDo;
    String searchingName = searchToDo.toUpperCase();

    int numConferences = map.values.toList()[0].length;

    String confName; // to save the value 'WS2020', 'WS2019', ...
    String confId; // to save the value 'id1', 'id2',...

    // get the conference we're in
    for(int i = 1; i <= numConferences; i++) {
      String aux = "id" + i.toString(); // id1, id2, ...
      confName = map.values.toList()[0][aux]["code"];
      if(confName == code) {
        confName = code;
        confId = aux;
      }
    }

    int numUsersInConference = map.values.toList()[0][confId]["users"].length;
    // get users of the conference we're in (iterable class)
    this.users = map.values.toList()[0][confId]["users"].keys;
    for(int i = 0; i < numUsersInConference; i++) {
      String user = users.elementAt(i); // get user no. i
      String userName = map.values.toList()[2][user]["name"]
          .toString()
          .toUpperCase();

      if (userName.contains(searchingName)) {
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
    }}


  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    code = widget.code;
    map = widget.map;
    searchToDo = widget.searchToDo;

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
                              ParticipantsList(
                                  auth: auth,
                                  code: code,
                                  map: map,
                                attendeeFilter: true,
                                speakerFilter: true,
                                sponsorFilter: true,
                                organizerFilter: true,)));
                });
              }
          ),
          title: RichText(
            text: TextSpan(
              text: 'Search Result for \n',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(text: searchToDo,
                    style: TextStyle(color: Colors.white60)),
              ],
            ),
          ),
          backgroundColor: Color(0xff1A2677),
        ),
        body: Stack(
          children: <Widget>[

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
                          leading:CircleAvatar(
                              backgroundImage: NetworkImage(image),
                              radius: 22
                          ),
                          title: Text(name, style: TextStyle(
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
                          trailing: IconButton(
                              icon: Icon(FontAwesomeIcons.arrowRight, color: Color(0xff1A2677) ),
                              onPressed: () async {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ViewProfile1(
                                          auth: auth,
                                          userToSee: userToSee, // id of user pressed
                                          map: map,
                                          code: widget.code,
                                        )));
                              })

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
          )
          ]


    ),
    );


    }
}