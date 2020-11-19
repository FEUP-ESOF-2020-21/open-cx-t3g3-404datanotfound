import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:ConfereceBook/MyProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Search.dart';
import './NewPost.dart';
import './NotificationsPanel.dart';
import './SeeallParticipants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

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

class HomeFeed extends StatefulWidget {
  HomeFeed({
    Key key,
    this.auth,
    this.image,
  }) : super(key: key);

  final FirebaseAuth auth;
  final String image;

  @override
  State<StatefulWidget> createState() => MyHomeFeed();
}

class MyHomeFeed extends State<HomeFeed> {
  FirebaseAuth auth;
  String image;
  String name;
  String city;
  String bio;
  String area;
  String job;
  String interests;
  String facebook;
  String instagram;
  String linkedin;
  String twitter;
  String github;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    image = widget.image;
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: new Icon(FontAwesomeIcons.search, color: const Color(0xffffffff),), onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SeeallParticipants()));
          }),
          IconButton(icon: new Icon(FontAwesomeIcons.bell, color: const Color(0xffffffff),), onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NotificationsPanel()));
          }),
          InkWell(
              onTap: () async {
                FirebaseDatabase.instance
                    .reference()
                    .once()
                    .then((DataSnapshot snapshot) {
                  Map<dynamic, dynamic> map = snapshot.value;
                  Map<dynamic, dynamic> map2 = snapshot.value;
                  Map<dynamic, dynamic> map3 = snapshot.value;
                  Map<dynamic, dynamic> map4 = snapshot.value;
                  Map<dynamic, dynamic> map5 = snapshot.value;
                  Map<dynamic, dynamic> map6 = snapshot.value;
                  Map<dynamic, dynamic> map7 = snapshot.value;
                  String user = auth.currentUser.uid;
                  this.image = map.values.toList()[0][user]["photo"];
                  this.name = map.values.toList()[0][user]["name"];
                  this.job = map.values.toList()[0][user]["job"];
                  this.interests = map.values.toList()[0][user]["interests"];
                  this.city = map.values.toList()[0][user]["city"];
                  this.bio = map.values.toList()[0][user]["bio"];
                  this.area = map.values.toList()[0][user]["area"];
                  this.linkedin = map.values.toList()[0][user]["linkedin"];
                  this.facebook = map.values.toList()[0][user]["facebook"];
                  this.instagram = map.values.toList()[0][user]["instagram"];
                  this.twitter = map.values.toList()[0][user]["twitter"];
                  this.github = map.values.toList()[0][user]["github"];
                  print(name);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyProfile(
                          auth: auth,
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
                          github: github)));
                });
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(this.image),
                radius: 22,
              )),
        ],
        title: Text(""),
        backgroundColor: const Color(0xff1A2677),
        leading: IconButton(icon: new Icon(FontAwesomeIcons.bars, color: const Color(0xffffffff),), onPressed: (){
          _scaffoldState.currentState.openDrawer();
        }),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(),
            ListTile(
              title: Text("MyProfile"),
              onTap: () async {
                FirebaseDatabase.instance
                    .reference()
                    .once()
                    .then((DataSnapshot snapshot) {
                  Map<dynamic, dynamic> map = snapshot.value;
                  Map<dynamic, dynamic> map2 = snapshot.value;
                  Map<dynamic, dynamic> map3 = snapshot.value;
                  Map<dynamic, dynamic> map4 = snapshot.value;
                  Map<dynamic, dynamic> map5 = snapshot.value;
                  Map<dynamic, dynamic> map6 = snapshot.value;
                  Map<dynamic, dynamic> map7 = snapshot.value;
                  String user = auth.currentUser.uid;
                  this.image = map.values.toList()[0][user]["photo"];
                  this.name = map.values.toList()[0][user]["name"];
                  this.job = map.values.toList()[0][user]["job"];
                  this.interests = map.values.toList()[0][user]["interests"];
                  this.city = map.values.toList()[0][user]["city"];
                  this.bio = map.values.toList()[0][user]["bio"];
                  this.area = map.values.toList()[0][user]["area"];
                  this.linkedin = map.values.toList()[0][user]["linkedin"];
                  this.facebook = map.values.toList()[0][user]["facebook"];
                  this.instagram = map.values.toList()[0][user]["instagram"];
                  this.twitter = map.values.toList()[0][user]["twitter"];
                  this.github = map.values.toList()[0][user]["github"];
                  print(name);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyProfile(
                          auth: auth,
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
                          github: github)));
                });
              },
            ),
            ListTile(
              title: Text("LogOut"),
              onTap: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MyLogin(
                        auth: auth,
                        )));
              },
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[

          Container(
              child: Column(
            children: <Widget>[
              Container(
                child: Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xff1A2677),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),

        ],
      ),
    );
  }
}

const String _svg_xapkg0 =
    '<svg viewBox="18.5 34.5 25.0 1.0" ><path transform="translate(18.5, 34.5)" d="M 0 0 L 25 0" fill="none" stroke="#680aee" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k4jlvk =
    '<svg viewBox="18.5 42.5 25.0 1.0" ><path transform="translate(18.5, 42.5)" d="M 0 0 L 25 0" fill="none" stroke="#680aee" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2ioq80 =
    '<svg viewBox="18.5 50.5 25.0 1.0" ><path transform="translate(18.5, 50.5)" d="M 0 0 L 25 0" fill="none" stroke="#680aee" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ymt87y =
    '<svg viewBox="0.0 16.7 15.9 10.0" ><path transform="translate(-2.0, 2.67)" d="M 15.91666698455811 14.013427734375 C 11.36666679382324 13.84676170349121 2 16.11343002319336 2 20.66342735290527 L 2 23.99676132202148 L 17.89999961853027 23.99676132202148 C 13.78333377838135 19.39675903320313 15.85000133514404 14.18009185791016 15.91666698455811 14.013427734375 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dgizqb =
    '<svg viewBox="16.7 13.3 16.7 16.7" ><path transform="translate(4.67, 1.33)" d="M 24.38333511352539 22.0333366394043 C 24.98333549499512 21.05000114440918 25.33333396911621 19.89999961853027 25.33333396911621 18.66666793823242 C 25.33333396911621 14.98333263397217 22.34999847412109 12 18.66666793823242 12 C 14.98333549499512 12 12 14.98333263397217 12 18.66666793823242 C 12 22.34999847412109 14.98333263397217 25.33333396911621 18.66666793823242 25.33333396911621 C 19.89999961853027 25.33333396911621 21.05000114440918 24.96666717529297 22.0333366394043 24.38333511352539 L 26.31666564941406 28.66666793823242 L 28.66666793823242 26.31666564941406 L 24.38333511352539 22.0333366394043 Z M 18.66666793823242 22 C 16.83333396911621 22 15.33333396911621 20.5 15.33333396911621 18.66666793823242 C 15.33333396911621 16.83333396911621 16.83333396911621 15.33333396911621 18.66666793823242 15.33333396911621 C 20.5 15.33333396911621 22 16.83333396911621 22 18.66666793823242 C 22 20.5 20.5 22 18.66666793823242 22 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_eterkn =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_luy4a2 =
    '<svg viewBox="2.0 2.0 20.0 20.0" ><path  d="M 21.98999977111816 4 C 21.98999977111816 2.900000095367432 21.10000038146973 2 20 2 L 4 2 C 2.900000095367432 2 2 2.900000095367432 2 4 L 2 16 C 2 17.10000038146973 2.900000095367432 18 4 18 L 18 18 L 22 22 L 21.98999977111816 4 Z" fill="#656565" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
