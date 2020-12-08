import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import "dart:async";
import "main.dart"; //for current user
import "HomeFeed.dart";
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class CommentsPage extends StatefulWidget {
  CommentsPage({
    Key key,
    this.auth,
    this.map,
    this.postID,
    this.confId,
  }) : super(key: key);

  final FirebaseAuth auth;
  final Map<dynamic, dynamic> map;
  final String postID;
  final String confId;

  @override
  createState() => new CommentsPageState();
}

class CommentsPageState extends State<CommentsPage> {
  FirebaseAuth auth;
  Map<dynamic, dynamic> map;
  String postID;
  String confId;

  // initialize all the lists to be present in ListView.Builder
  List<String> commentIDs = new List();
  List<String> commentsText = new List();
  List<String> commentsAuthor = new List();

  var postComments; // iterable class to be, which will save the commentsIDS in post
  int numComments;
  String val;

  String comment = "";

  @override
  void initState() {
    super.initState();
    auth = widget.auth;
    map = widget.map;
    postID = widget.postID;
    confId = widget.confId;

    if (map.values.toList()[1][confId][postID]["comments"] == null)
      numComments = 0;
    else {
      numComments = map.values.toList()[1][confId][postID]["comments"].length;

      // get comments of the post we choose (iterable class)
      this.postComments = map.values.toList()[1][confId][postID]["comments"].keys;

      //get comments IDs
      for(int i = 0; i < numComments; i++) {
        String commentID = postComments.elementAt(i); // get comment no. i
        commentIDs.add(commentID);
      }
      commentIDs.sort((b,a) => a.compareTo(b)); //sort comments

      for(int i = 0; i < numComments; i++) {
      String commentID = commentIDs[i]; // get comment no. i
      // knowing the id of each comment, save its text and author
      commentsText.add(map.values.toList()[1][confId][postID]["comments"][commentID]["text"]);
      commentsAuthor.add(map.values.toList()[1][confId][postID]["comments"][commentID]["author"]);

      }
    }
  }

  //add new comment to the database, refreshing the comments page
  void _addComment(String val) async {
    insertDatabase(val);
    FirebaseDatabase.instance.reference().once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> map = snapshot.value;

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => CommentsPage(
                auth: widget.auth, //user that will comment
                map: map,
                postID: postID,
                confId: confId,
              )));
    });
  }

  //build list of comments
  Widget _buildCommentList() {
    return ListView.builder(
        itemCount: numComments,
        itemBuilder: (context, index) {
          //define the parameters for each comment
          String commentID = commentIDs[index];
          String name =
              map.values.toList()[2][commentsAuthor[index]]["name"].toString();
          String userPhoto =
              map.values.toList()[2][commentsAuthor[index]]["photo"].toString();

          return _buildCommentItem(
              commentsText[index], name, userPhoto, commentID);
        });
  }

  //create comment widget
  Widget _buildCommentItem(
      String comment, String name, String userPhoto, String commentID) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: NetworkImage(userPhoto),
        //default image
      ),
      subtitle: Text(comment),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name),
            Text(checkSameDay(commentID), style: new TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
            ),),
          ]),
      isThreeLine: true,
    ));
  }

  //insert comment in the database
  Future insertDatabase(String val) async {
    DatabaseReference firebaseDatabaseRef = FirebaseDatabase.instance
        .reference()
        .child('Posts')
        .child(confId)
        .child(postID)
        .child("comments");

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – HH:mm').format(now);

    firebaseDatabaseRef.child(formattedDate).set({
      'text': val,
      'author': auth.currentUser.uid,
    });
  }

  String checkSameDay(String date) {
    DateTime now = DateTime.now();
    String today = DateFormat('yyyy-MM-dd').format(now);

    DateTime yesterday = now.subtract(Duration(days: 1));
    String yester = DateFormat('yyyy-MM-dd').format(yesterday);

    String hour = date.substring(13, 18);
    String day = date.substring(0, 10);

    if (date.contains(today))
      return "Today (" + hour + ")";
    else if (date.contains(yester))
      return "Yesterday (" + hour + ")";
    return day + " (" + hour + ")";
  }

  showAlertDialog(BuildContext context)
  {
    // configura o button
    Widget stay = FlatButton(
      child: Text("Stay"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget leave = FlatButton(
      child: Text("Discard"),
      onPressed: () {
        FirebaseDatabase.instance
            .reference()
            .once()
            .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> map = snapshot.value;
          String image = map.values.toList()[2]
          [widget.auth.currentUser.uid]["photo"];
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  HomeFeed(
                    auth: widget.auth,
                    code: widget.confId,
                    map: map,
                  )));
        });
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Discard comment?"),
      content: Text("You have a comment ready to be posted!"),
      actions: [
        stay,
        leave
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Comments"),
          leading: IconButton(
            //button to return to feed
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () async {
              if (this.comment != "") {
                showAlertDialog(context);
              } else {
                FirebaseDatabase.instance
                    .reference()
                    .once()
                    .then((DataSnapshot snapshot) {
                  Map<dynamic, dynamic> map = snapshot.value;
                  String image = map.values.toList()[2]
                  [widget.auth.currentUser.uid]["photo"];
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          HomeFeed(
                            auth: widget.auth,
                            code: widget.confId,
                            map: map,
                          )));
                });
              }
              },
          ),
          backgroundColor: const Color(0xff1A2677),
        ),
        body: Column(children: <Widget>[
          Expanded(
              //build list of current comments
              child: _buildCommentList()
          ),
          //text field to add a comment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  onChanged: (String submittedStr) {
                      this.comment = submittedStr;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20.0),
                    hintText: "Add comment",
                    border: InputBorder.none, //OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: 50,
                child: RawMaterialButton(
                  onPressed: () {
                    if (this.comment != "") {
                      _addComment(this.comment);
                      this.comment = "";
                    }
                  },
                  elevation: 2.0,
                  fillColor: const Color(0xff1A2677),
                  child: Icon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  shape: CircleBorder(),
                )
              ),

            ],
          ),

        ]));
  }
}
