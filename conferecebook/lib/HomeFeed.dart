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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'ModerationSettings.dart';
import 'ViewProfile1.dart';
import 'CommentsPage.dart';

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
  State<StatefulWidget> createState() => _HomeFeed();
}

class _HomeFeed extends State<HomeFeed> {
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
  var likes;
  Map<dynamic, dynamic> comments;
  int numComments;


  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    myMap = widget.map;
    code = widget.code;
    image = myMap.values.toList()[2][auth.currentUser.uid]["photo"];
    print("Beginning" + code);

    // get the role of current user
    int numConferences = myMap.values.toList()[0].length;

    String confName; // to save the value 'WS2020', 'WS2019', ...
    String confId; // to save the value 'id1', 'id2',...

    bool postsFromSponsors;
    bool postsFromSpeakers;
    bool postsFromAttendees;

    int maxPostsFromSponsors;
    int maxPostsFromSpeakers;
    int maxPostsFromAttendees;

    // get the conference we're in
    for(int i = 1; i <= numConferences; i++) {
      String aux = "id" + i.toString();
      confName = myMap.values.toList()[0][aux]["code"];
      if(confName == code) {
        confId = aux;
      }
    } // from here we get the id of conference we're in
    // with the id, we'll get the role of the user

    // get the role of auth user
    String userRole = myMap.values.toList()[0][confId]["users"][auth.currentUser.uid];
    print("Authenticated user is $userRole");

    // for post moderation
    // get the reference to Firebase
    DatabaseReference firebaseDatabaseRef =
    FirebaseDatabase.instance.reference().child('Conferences').child(confId);

    // if values are not defined, set default ones
    if (myMap.values.toList()[0][confId]["postsControl"] == null) {

      // default values for all conferences
      postsFromSponsors = false;
      postsFromSpeakers = true;
      postsFromAttendees = true;
      maxPostsFromSponsors = 3;
      maxPostsFromSpeakers = 5;
      maxPostsFromAttendees = 10;

      // add default values to database
      firebaseDatabaseRef
          .child("postsControl")
          .child("postsFromSponsors")
          .set(postsFromSponsors);

      firebaseDatabaseRef
          .child("postsControl")
          .child("postsFromSpeakers")
          .set(postsFromSpeakers);

      firebaseDatabaseRef
          .child("postsControl")
          .child("postsFromAttendees")
          .set(postsFromAttendees);

      firebaseDatabaseRef
          .child("postsControl")
          .child("maxPostsFromSponsors")
          .set(maxPostsFromSponsors);

      firebaseDatabaseRef
          .child("postsControl")
          .child("maxPostsFromSpeakers")
          .set(maxPostsFromSpeakers);

      firebaseDatabaseRef
          .child("postsControl")
          .child("maxPostsFromAttendees")
          .set(maxPostsFromAttendees);

    }
    // if values are defined, get them!
    else {
      // get map with postsControl values
      Map<dynamic, dynamic> postsControl = myMap.values.toList()[0][confId]["postsControl"];
      // get each individual value
      postsFromSponsors = postsControl["postsFromSponsors"];
      postsFromSpeakers = postsControl["postsFromSpeakers"];
      postsFromAttendees = postsControl["postsFromAttendees"];
      maxPostsFromSponsors = postsControl["maxPostsFromSponsors"];
      maxPostsFromSpeakers = postsControl["maxPostsFromSpeakers"];
      maxPostsFromAttendees = postsControl["maxPostsFromAttendees"];

    }

    bool lockedPosts = false;
    bool limitReached = false;
    int limitForThisUser;
    String typeOfControl;

    int numPostsFromThisUser = 0;
    int numTotalPosts;
    int numPostsLeft;
    var posts;
    List<String> postsIDs = new List();


    if(myMap.values.toList()[1][code]==null)
      numTotalPosts = 0;
    else{
      numTotalPosts = myMap.values.toList()[1][code].length;

      // get posts
      posts = myMap.values.toList()[1][code].keys;

      //get postsIDs
      for(int i = 0; i < numTotalPosts; i++) {
        String postID = posts.elementAt(i); // get post no. i
        postsIDs.add(postID);
      }
      postsIDs.sort((b,a) => a.compareTo(b)); //sort posts

    }

    // compute number of posts from this user
    for(int i = 0; i < numTotalPosts; i++) {
      String post = posts.elementAt(i); // for each post
      // get to know who has done the post
      String userOfThisPost = myMap.values.toList()[1][code][post]["user"];
      // check if the user who done post is the authenticated user
      if (userOfThisPost == auth.currentUser.uid)
        numPostsFromThisUser++;
    }

    // decide if it's locked or at limit for each userRole
    // get number of posts yet to do
    switch (userRole) {
      case "Sponsor": {
        if(postsFromSponsors == false) {
          lockedPosts = true;
          typeOfControl = "Lock";
          print("$userRole has his posts locked");
        }
        else if(numPostsFromThisUser >=  maxPostsFromSponsors) {
          limitReached = true;
          limitForThisUser = maxPostsFromSponsors;
          typeOfControl = "Limit";
          print("Limit of posts reached: user has $numPostsFromThisUser, limit is $limitForThisUser");
        }
        else {
          numPostsLeft = maxPostsFromSponsors - numPostsFromThisUser;
          typeOfControl = "Allowed";
          print("As a $userRole, you still have $numPostsLeft posts to do");
        }
      }
      break;

      case "Speaker": {
        if(postsFromSpeakers == false) {
          lockedPosts = true;
          typeOfControl = "Lock";
          print("$userRole has his posts locked");
        }
        else if(numPostsFromThisUser >=  maxPostsFromSpeakers) {
          limitReached = true;
          limitForThisUser = maxPostsFromSpeakers;

          typeOfControl = "Limit";
          print("Limit of posts reached: user has $numPostsFromThisUser, limit is $limitForThisUser");
        }
        else {
          numPostsLeft = maxPostsFromSpeakers - numPostsFromThisUser;
          typeOfControl = "Allowed";
          print("As a $userRole, you still have $numPostsLeft posts to do");
        }
      }
      break;

      case "Attendee": {
        if(postsFromAttendees == false) {
          lockedPosts = true;
          typeOfControl = "Lock";
          print("$userRole has his posts locked");
        }
        else if(numPostsFromThisUser >=  maxPostsFromAttendees) {
          limitReached = true;
          limitForThisUser = maxPostsFromAttendees;
          typeOfControl = "Limit";
          print("Limit of posts reached: user has $numPostsFromThisUser, limit is $limitForThisUser");
        }
        else {
          numPostsLeft = maxPostsFromAttendees - numPostsFromThisUser;
          typeOfControl = "Allowed";
          print("As a $userRole, you still have $numPostsLeft posts to do");
        }
      }
      break;

    }

    // if limit is not reached nor posts are locked, user can post
    bool canPost = !lockedPosts & !limitReached;
    print("User can post: $canPost");

    // method that shows up whe organizer wants to delete a post
    showDeleteDialog(BuildContext context, String postID){
      // configura o button cancel
      Widget cancel = FlatButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      // configures button delete
      Widget delete = FlatButton(
        child: Text("Delete"),
        onPressed: () {
          FirebaseDatabase.instance // delete from Firebase
              .reference()
              .child("Posts")
              .child(code)
              .child(postID)
              .remove();

          FirebaseDatabase.instance // update the map and rebuild
              .reference()
              .once()
              .then((DataSnapshot snapshot) {
            Map<dynamic, dynamic> map = snapshot.value;
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    HomeFeed(
                      auth: this.auth,
                      code: this.code,
                      map: map,
                    )));
          });

        },
      );
      // configura o  AlertDialog
      AlertDialog alerta = AlertDialog(
        title: Text("Delete this post?"),
        content: Text("Are you sure you want to delete this post?"),
        actions: [
          cancel,
          delete
        ],
      );
      // exibe o dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        },
      );
    }

    //function to see if post is liked by specific user
    bool postIsLiked(var likes, String user){
      if(likes==null){
        return false; //if likes list is null, the post has no likes
      }else {
        if (likes.contains(user)) {
          return true; //the user is on the list of users who liked the post
        }
        return false; //the user is not on the list of users who liked the post
      }
    }

    //function to see if post is liked by specific user
    bool postIsCommented(Map<dynamic, dynamic> comments, String user){
      for (int i=0; i<comments.keys.toList().length; i++){
        if(comments.values.toList()[i]["author"].toString()==user)
          return true; //the user is on the list of users who commented the post
      }
      return false; //the user is not on the list of users who liked the post
    }

    bool isLiked;
    bool isCommented;

    showLimitDialog(BuildContext context){

      String textToShow;
      String subTextToShow;

      switch (typeOfControl) {
        case "Lock": {
          textToShow = "Posts for $userRole are locked for now";
          subTextToShow = "Ask an Organizer to unlock posts for $userRole";
        }
        break;

        case "Limit": {
          textToShow = "You have reached the limit for posts!";
          subTextToShow = "The limit of posts for $userRole is now $limitForThisUser "
              "and you have done $numPostsFromThisUser posts.";
        }
        break;
      }

      // set the ok button
      Widget ok = FlatButton(
        child: Text("Ok", style: TextStyle(color: Color(0xff1A2677)),),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // configure  AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(textToShow),
        content: Text(subTextToShow),
        actions: [
          ok
        ],
      );

      // exhibit dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

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
            IconButton(icon: new Icon(FontAwesomeIcons.redoAlt, color: const Color(0xffffffff),), onPressed: () async {
              FirebaseDatabase.instance
                  .reference()
                  .once()
                  .then((DataSnapshot snapshot) {
                Map<dynamic, dynamic> map = snapshot.value;
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeFeed(
                      auth: auth,
                      map: map,
                      code: code,
                    )));
              });
            }),
            IconButton(icon: new Icon(FontAwesomeIcons.users, color: const Color(0xffffffff),),
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
                        )));
                  });
                }
            ),

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
                        builder: (context) => MyProfile1(
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
          title: Text(myMap.values.toList()[0][confId]["name"]), //display conference name
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
                        builder: (context) => MyProfile1(
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
              if (userRole == "Organizer")
                ListTile(
                  leading: new Icon(
                    FontAwesomeIcons.wrench, color: const Color(0xff1A2677),),
                  title: Text("Moderation Settings"),
                  onTap: () {
                    FirebaseDatabase.instance.reference().once().then((
                        DataSnapshot snapshot) {
                      Map<dynamic, dynamic> map = snapshot.value;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              ModerationSettings(
                                  auth: auth,
                                  code: code,
                                  confId: confId,
                                  map: map
                              )
                      ));
                      print(auth.currentUser.uid);
                    });
                  },
                ),
              ListTile(
                leading: new Icon(
                  FontAwesomeIcons.signOutAlt, color: const Color(0xff1A2677),),
                title: Text("LogOut"),
                onTap: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          MyLogin(
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
                  padding: EdgeInsets.only(bottom:40),//por post: for por ciclo
                  shrinkWrap: true,
                  itemCount: numPosts,
                  itemBuilder: (context, position) {

                    this.likes=null; //restart likes variable

                    String user = auth.currentUser.uid;
                    String confId=widget.code;

                    String postID = postsIDs[position];
                    String userUID = myMap.values.toList()[1][confId][postID]["user"];
                    String text = myMap.values.toList()[1][confId][postID]["text"];
                    String multimedia = myMap.values.toList()[1][confId][postID]["multimedia"];
                    String name = myMap.values.toList()[2][userUID]["name"];
                    String userPhoto = myMap.values.toList()[2][userUID]["photo"];
                    Uri uri = Uri.parse(multimedia);
                    String typeString = uri.path.substring(uri.path.length - 3)
                        .toLowerCase();


                    if(myMap.values.toList()[1][confId][postID]["likes"]!=null){
                      this.likes=myMap.values.toList()[1][confId][postID]["likes"].keys;}

                    if(myMap.values.toList()[1][confId][postID]["likes"]!=null){
                      this.likes=myMap.values.toList()[1][confId][postID]["likes"].keys;}

                    if(myMap.values.toList()[1][confId][postID]["comments"]!=null){
                      comments = myMap.values.toList()[1][confId][postID]["comments"];
                      numComments = myMap.values.toList()[1][confId][postID]["comments"].length;
                      if (postIsCommented(comments, user)) {
                          isCommented = true;
                      }
                      if(isCommented==null)
                        isCommented=false;
                    }
                    else {
                      numComments = 0;
                      isCommented=false; //by default
                    }

                    String type = "";
                    if (typeString == "jpg") {
                      type = "image";
                    } else if (typeString == "mp4") {
                      type = "video";
                    }

                    if(postIsLiked(likes, user)){
                      isLiked=true;
                    }else{
                      isLiked=false;
                    }

                    //build string for number of likes in post
                    String numLikes = "";
                    if (likes==null) {
                      numLikes = "0";
                    } else {
                      numLikes = this.likes.length.toString();
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
                                if (userRole == "Organizer")
                                  IconButton(
                                      icon: Icon(FontAwesomeIcons.times, color: Color(0xff8d0000)),
                                      onPressed: () {
                                        showDeleteDialog(context, postID);
                                      }
                                  ),
                                Transform.translate(
                                    offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight *  0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(name + "  ", style: TextStyle(color: const Color(0xff000000), fontWeight: FontWeight.bold),),
                                        InkWell(
                                          onTap: () async {
                                            FirebaseDatabase.instance
                                                .reference()
                                                .once()
                                                .then((DataSnapshot snapshot) {
                                              Map<dynamic, dynamic> map = snapshot.value;

                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (context) => ViewProfile1(
                                                      auth: widget.auth,
                                                      userToSee: userUID,
                                                      map: map,
                                                      code: widget.code)));
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: NetworkImage(userPhoto),
                                            //default image
                                          ),
                                        )],
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
                                              )),),) : Container(),
                                    ),),),
                                Container(
                                    alignment: Alignment.bottomCenter,
                                    //offset: Offset(SizeConfig.screenWidth *  0.0, multimedia != " " ? SizeConfig.screenHeight *  470.0 : SizeConfig.screenHeight * 190.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text("      " + postID, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54,), ),
                                        Expanded(child: SizedBox()),
                                        Text("    "+numComments.toString()+"   "),
                                        IconButton(
                                          icon: isCommented ? Icon(FontAwesomeIcons.commentAlt, color: Colors.black) : Icon(FontAwesomeIcons.commentAlt, color: Colors.grey),
                                          onPressed: () async {
                                              FirebaseDatabase.instance
                                                  .reference()
                                                  .once()
                                                  .then((DataSnapshot snapshot) {
                                                Map<dynamic, dynamic> map = snapshot
                                                    .value;
                                                Map<dynamic, dynamic> postInfo = map.values.toList()[1][widget.code];

                                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                    builder: (context) => CommentsPage(
                                                        auth: widget.auth, //user that will comment
                                                        map: map,
                                                        postID: postID,
                                                        confId: confId,
                                                    )));
                                              });

                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage()));
                                          }
                                        ),

                                        SizedBox(width: 25),
                                        Text(numLikes),
                                        IconButton(
                                          icon: isLiked ? Icon(FontAwesomeIcons.solidHeart, color: Colors.red) : Icon(FontAwesomeIcons.heart, color: Colors.grey),
                                          onPressed: () {
                                            setState((){
                                              likes=null;
                                              FirebaseDatabase.instance //get current likes of post
                                                  .reference()
                                                  .once()
                                                  .then((DataSnapshot snapshot) {
                                                Map<dynamic, dynamic> map = snapshot
                                                    .value;
                                                Map<dynamic, dynamic> postInfo = map.values.toList()[1][widget.code];
                                              });
                                              if(myMap.values.toList()[1][confId][postID]["likes"]!=null){
                                                this.likes=myMap.values.toList()[1][confId][postID]["likes"].keys;
                                              }

                                              isLiked = postIsLiked(likes, user); //get current state of like
                                              isLiked =! isLiked; //change like state
                                              if(isLiked) {
                                                //add to firebase
                                                DatabaseReference firebaseDatabaseRef =
                                                FirebaseDatabase.instance.reference().child(
                                                    'Posts').child(code).child(postID);
                                                firebaseDatabaseRef
                                                    .child("likes")
                                                    .child(widget.auth.currentUser.uid)
                                                    .set(1);
                                              }else{
                                                FirebaseDatabase.instance // delete from Firebase
                                                    .reference()
                                                    .child("Posts")
                                                    .child(code)
                                                    .child(postID)
                                                    .child("likes")
                                                    .child(widget.auth.currentUser.uid)
                                                    .remove();
                                              }
                                              //rebuild home feed
                                              FirebaseDatabase.instance
                                                  .reference()
                                                  .once()
                                                  .then((DataSnapshot snapshot) {
                                                Map<dynamic, dynamic> map = snapshot.value;
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) => HomeFeed(
                                                            auth: auth,
                                                            code: widget.code,
                                                            map: map )));
                                              });

                                            });
                                          },
                                        ),
                                      ],
                                    )
                                ),],)));},)),

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
                            if (canPost) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Post(auth: widget.auth,
                                            postsLeft: numPostsLeft,
                                            userRole: userRole,
                                            code: widget.code,)));
                            }
                            else // posts are not allowed
                              showLimitDialog(context);
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
            IconButton(icon: new Icon(FontAwesomeIcons.users, color: const Color(0xffffffff),),
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
                        )));
                  });
                }
            ),
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
                        builder: (context) => MyProfile1(
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
                        builder: (context) => MyProfile1(
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
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                if (canPost) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Post(auth: widget.auth,
                                                postsLeft: numPostsLeft,
                                                userRole: userRole,
                                                code: widget.code,)));
                                }
                                else // posts are not allowed
                                  showLimitDialog(context);
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
