
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Search.dart';
import './NewPost.dart';
import './NotificationsPanel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

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
    this.code,
    this.map,
  }) : super(key: key);

  final FirebaseAuth auth;
  final String code;
  final Map<dynamic, dynamic> map;
  @override
  State<StatefulWidget> createState() => MyHomeFeed();
}

class MyHomeFeed extends State<HomeFeed> {
  VideoPlayerController _controller;
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
  String code;
  Map<dynamic, dynamic> myMap;
  int numPosts;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    myMap = widget.map;
    code = widget.code;
    print(auth.currentUser.uid);
    image = myMap.values.toList()[2][auth.currentUser.uid]["photo"];
    print("Beginning" + code);
    try {
      numPosts = myMap.values.toList()[1][widget.code].length;
    } catch(e) {
      numPosts = 0;
    }
    SizeConfig().init(context);
    if (numPosts != 0) {
    return WillPopScope(
    onWillPop: () async => false, child: Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: new Icon(FontAwesomeIcons.users, color: const Color(0xffffffff),), onPressed: () async {

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
                )));
              });
          }),
          IconButton(icon: new Icon(FontAwesomeIcons.bell, color: const Color(0xffffffff),), onPressed: (){
            //Navigator.of(context).pushReplacement(MaterialPageRoute(
                //builder: (context) => NotificationsPanel()));
          }),
          InkWell(
              onTap: () async {
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
                          github: github,
                      code: code)));
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
              leading: new Icon(FontAwesomeIcons.userAlt, color: const Color(0xff1A2677),),
              title: Text("MyProfile"),
              onTap: () async {
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
              leading: new Icon(FontAwesomeIcons.plusCircle, color: const Color(0xff1A2677),),
              title: Text("Enter Event Code"),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => EnterEventCode(
                      auth: widget.auth,
                    )));
              },
            ),
            ListTile(
              leading: new Icon(FontAwesomeIcons.exchangeAlt, color: const Color(0xff1A2677),),
              title: Text("Change to Other Event"),
              onTap: () {
                FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot) {
                  Map<dynamic, dynamic> map = snapshot.value;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => JoinAnEvent(auth: widget.auth, map: map,)
                  ));
                });
              },
            ),
            ListTile(
              leading: new Icon(FontAwesomeIcons.bell, color: const Color(0xff1A2677),),
              title: Text("Notifications Panel"),
              onTap: () {
              },
            ),
            ListTile(
              leading: new Icon(FontAwesomeIcons.users, color: const Color(0xff1A2677),),
              title: Text("Participants List"),
              onTap: () async {
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
                    )));
                });
              },
            ),
            ListTile(
              leading: new Icon(FontAwesomeIcons.signOutAlt, color: const Color(0xff1A2677),),
              title: Text("LogOut"),
              onTap: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MyLogin(
                      auth: auth,
                    )));
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight *  0.0),
            child: ListView.builder(
              shrinkWrap:true,
              itemCount: numPosts,
              itemBuilder: (context, position) {
                Map<dynamic, dynamic> postInfo = myMap.values.toList()[1][widget.code];
                String userUID = postInfo.values.toList()[position]["user"];
                String text = postInfo.values.toList()[position]["text"];
                String multimedia = postInfo.values.toList()[position]["multimedia"];
                int likes = postInfo.values.toList()[position]["likes"];
                int numComments = postInfo.values.toList()[position]["numComments"];
                String name = myMap.values.toList()[2][userUID]["name"];
                String userPhoto = myMap.values.toList()[2][userUID]["photo"];
                Uri uri = Uri.parse(multimedia);
                String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
                String type = "";
                if (typeString == "jpg") {
                  type = "image";
                }
                if (typeString == "mp4") {
                  type = "video";
                }
                return Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: const Color(0xffD3D3D3),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffD3D3D3),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child:  SizedBox(
                        width: multimedia != " " ? SizeConfig.screenWidth * 500 : SizeConfig.screenWidth * 200,
                        height: multimedia != " " ? SizeConfig.screenHeight * 500 : SizeConfig.screenWidth * 200,
                    child: Stack(
                      children: <Widget>[
                    Transform.translate(
                    offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight *  0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Text(name + "  ", style: TextStyle(color: const Color(0xff000000), fontWeight: FontWeight.bold),),
                      CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(userPhoto) //default image
                      ),
                    ],
                  )
                    ),
                        Transform.translate(
                            offset: Offset(SizeConfig.screenWidth *  0.0, multimedia != " " ? SizeConfig.screenHeight *  470.0 : SizeConfig.screenHeight * 190.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(likes.toString() + " "),
                                Icon(FontAwesomeIcons.commentAlt),
                                Text("    "+numComments.toString()+" "),
                                Icon(FontAwesomeIcons.heart),
                              ],
                            )
                        ),
                        Transform.translate(
                            offset: Offset(SizeConfig.screenWidth * 60.0, SizeConfig.screenHeight * 50.0),
                            child:  SizedBox(
                              width: SizeConfig.screenWidth * 250 ,
                              height: SizeConfig.screenHeight * 500 ,
                              child: text != null ? Text(text, style: TextStyle(color: const Color(0xff000000)),) : Container()
                        ),),
                  Transform.translate(
                      offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight * 95.0),
                      child: SizedBox(
                          width: multimedia != " " ? SizeConfig.screenWidth * 360 : 0,
                          height: multimedia != " " ? SizeConfig.screenHeight * 360 : 0,
                          child: Container(
                            child: multimedia != " " ? (type == "image") ? Image(image: NetworkImage(multimedia)) :
                            Container(
                              child:Scaffold(
                                body: Center(
                                  child: Container(
                                    child: Text('Unable to show media'),
                                  )

                                ),
                              ),
                            ) : Container(),
                          ),
                        ),),

                      ],)));
              },
            )
          ),
        ],
      ),
      floatingActionButton: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => Post(auth: widget.auth,code: widget.code,)));
                        },
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
    ));} else {
      return WillPopScope(
          onWillPop: () async => false, child: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: new Icon(FontAwesomeIcons.users, color: const Color(0xffffffff),), onPressed: (){

            }),
            IconButton(icon: new Icon(FontAwesomeIcons.bell, color: const Color(0xffffffff),), onPressed: (){

            }),
            InkWell(
                onTap: () async {
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
                            github: github,
                        code: widget.code)));
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
                leading: new Icon(FontAwesomeIcons.userAlt, color: const Color(0xff1A2677),),
                title: Text("MyProfile"),
                onTap: () async {
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
                leading: new Icon(FontAwesomeIcons.plusCircle, color: const Color(0xff1A2677),),
                title: Text("Enter Event Code"),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => EnterEventCode(
                        auth: widget.auth,
                      )));
                },
              ),
              ListTile(
                leading: new Icon(FontAwesomeIcons.exchangeAlt, color: const Color(0xff1A2677),),
                title: Text("Change to Other Event"),
                onTap: () {
                  FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot) {
                    Map<dynamic, dynamic> map = snapshot.value;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => JoinAnEvent(auth: widget.auth, map: map,)
                    ));
                  });
                },
              ),
              ListTile(
                leading: new Icon(FontAwesomeIcons.bell, color: const Color(0xff1A2677),),
                title: Text("Notifications Panel"),
                onTap: () {
                },
              ),
              ListTile(
                leading: new Icon(FontAwesomeIcons.users, color: const Color(0xff1A2677),),
                title: Text("Participants List"),
                onTap: () {
                },
              ),
              ListTile(
                leading: new Icon(FontAwesomeIcons.signOutAlt, color: const Color(0xff1A2677),),
                title: Text("LogOut"),
                onTap: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyLogin(
                        auth: auth,
                      )));
                },
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.frownOpen),
                  Text("\n Ups! There isn't any \n post for this conference!", textAlign: TextAlign.center,),
                ],
              )
            ),
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
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => Post(auth: widget.auth,code: widget.code,)));
                              },
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
      ));
    }
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
