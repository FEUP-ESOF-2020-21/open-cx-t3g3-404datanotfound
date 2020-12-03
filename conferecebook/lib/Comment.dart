/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import "dart:async";
import "main.dart"; //for current user

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

class CommentScreen extends StatefulWidget {
  final String postId;
  final String postMediaUrl; //??
  final FirebaseAuth auth;
  final String code;

  CommentScreen({this.postId, this.postMediaUrl, this.auth, this.code});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final String postId;
  final String postMediaUrl;
  final String code;

  bool didFetchComments = false;
  List<Comment> fetchedComments = [];

  final TextEditingController _commentController = TextEditingController();

  _CommentScreenState({this.postId, this.postOwner, this.postMediaUrl});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildPage(),
    );
  }

  Widget buildPage() {
    return Column(
      children: [
        Expanded(
          child:
          buildComments(),
        ),
        Divider(),
        ListTile(
          title: TextFormField(
            controller: _commentController,
            decoration: InputDecoration(labelText: 'Write a comment...'),
            onFieldSubmitted: addComment,
          ),
          trailing: OutlineButton(onPressed: (){addComment(_commentController.text);}, borderSide: BorderSide.none, child: Text("Post"),),
        ),
      ],
    );
  }


  Widget buildComments() {
    if (this.didFetchComments == false){
      return FutureBuilder<List<Comment>>(
          future: getComments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator());

            this.didFetchComments = true;
            this.fetchedComments = snapshot.data;
            return ListView(
              children: snapshot.data,
            );
          });
    } else {
      // for optimistic updating
      return ListView(
          children: this.fetchedComments
      );
    }
  }

  Future<List<Comment>> getComments() async {
    List<Comment> comments = [];

    DatabaseReference firebaseDatabaseRef = FirebaseDatabase.instance
        .reference()
        .child('Posts')
        .child(code)
        .child(postId)
        .child("comments");

    for(var i=0; i<firebaseDatabaseRef.keys.toList().length; i++)
    firebaseDatabaseRef.keys.forEach((DocumentSnapshot doc) {
      comments.add(Comment.fromDocument(doc));
    });
    return comments;
  }

  addComment(String comment) {
    _commentController.clear();
    DatabaseReference firebaseDatabaseRef =
    FirebaseDatabase.instance.reference().child(
        'Posts').child(code).child(postID);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    firebaseDatabaseRef
        .child("comments")
        .child(widget.auth.currentUser.uid)
        .set({
      "comment": comment,
      "timestamp": Timestamp.now(),
      "avatarUrl": currentUserModel.photoUrl,
      'user': widget.auth.currentUser.uid,
    });

    //adds to postOwner's activity feed
    FirebaseDatabase.instance
        .collection("insta_a_feed")
        .document(postOwner)
        .collection("items")
        .add({
      "username": currentUserModel.username,
      "userId": currentUserModel.id,
      "type": "comment",
      "userProfileImg": currentUserModel.photoUrl,
      "commentData": comment,
      "timestamp": Timestamp.now(),
      "postId": postId,
      "mediaUrl": postMediaUrl,
    });

    // add comment to the current listview for an optimistic update
    setState(() {
      fetchedComments = List.from(fetchedComments)..add(Comment(
          username: currentUserModel.username,
          comment: comment,
          timestamp: Timestamp.now(),
          avatarUrl: currentUserModel.photoUrl,
          userId: currentUserModel.id
      ));
    });
  }



  Future insertDatabase() async {
    if (_multiFile != null) {
      String file = basename(_multiFile.path);
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('posts/$file');
      UploadTask uploadTask = firebaseStorageRef.putFile(_multiFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      taskSnapshot.ref.getDownloadURL().then((value) {
        URL = value;
        DatabaseReference firebaseDatabaseRef =
        FirebaseDatabase.instance.reference().child('Posts').child(code);

        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        if (text == "") text = " ";
        firebaseDatabaseRef.child(formattedDate).set({
          'text': text,
          'multimedia': URL,
          'user': widget.auth.currentUser.uid,
          'likes': likes,
          'numComments': 0
        });
      });
    } else {
      DatabaseReference firebaseDatabaseRef =
      FirebaseDatabase.instance.reference().child('Posts').child(code);

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      if (text == "") text = " ";
      URL = " ";

      firebaseDatabaseRef.child(formattedDate).set({
        'text': text,
        'multimedia': URL,
        'user': widget.auth.currentUser.uid,
        'likes': likes,
        'numComments': 0
      });
    }
  }


}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  Comment(
      {this.username,
        this.userId,
        this.avatarUrl,
        this.comment,
        this.timestamp});

  factory Comment.fromDocument(DocumentSnapshot document) {
    return Comment(
      username: document['username'],
      userId: document['userId'],
      comment: document["comment"],
      timestamp: document["timestamp"],
      avatarUrl: document["avatarUrl"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(comment),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        Divider(),
      ],
    );
  }
}*/
