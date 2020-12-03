import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:ConfereceBook/CreateProfile4.dart';
import 'package:ConfereceBook/HomeFeed.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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

class Post extends StatefulWidget {
  Post({Key key, this.auth, this.code}) : super(key: key);

  final FirebaseAuth auth;
  final String code;

  @override
  State<StatefulWidget> createState() => MyPost();
}

class MyPost extends State<Post> {
  String code;
  File _multiFile;
  final ImagePicker _picker = ImagePicker();

  showAlertDialog2(BuildContext context)
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
          String image = map.values.toList()[2][widget
              .auth.currentUser.uid]["photo"];
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      HomeFeed(
                        auth: widget.auth,
                        code: widget.code,
                        map: map,)));
        });
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Discard post?"),
      content: Text("You've content loaded and ready to be posted!"),
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

  Widget bottomSheet(String type) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(this.context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose the Source',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                take(ImageSource.camera, type);
              },
              label: Text('Camera'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                take(ImageSource.gallery, type);
              },
              label: Text('Gallery'),
            ),
          ]),
        ],
      ),
    );
  }

  String multimediaLoaded = " ";

  void take(ImageSource source, String type) async {
    if (type == "photo") {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setState(() {
        _multiFile = File(pickedFile.path);
        multimediaLoaded = "Picture loaded with success!";
      });
    } else if (type == "video") {
      final pickedFile = await _picker.getVideo(
        source: source,
      );
      setState(() {
        _multiFile = File(pickedFile.path);
        multimediaLoaded = "Video loaded with success!";
      });
    }
  }

  Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(imageUrl);
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta;
    alerta = AlertDialog(
      title: Text("Empty Post"),
      content: Text(
          "You have to upload a Picture or a Video or just write something!"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  // ignore: non_constant_identifier_names
  String URL;
  dynamic likes;

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

  String text;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    code = widget.code;
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Expanded(
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding:
                          EdgeInsets.only(left: 20.0, top: 35.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              if (text == null && _multiFile == null) {
                                FirebaseDatabase.instance
                                    .reference()
                                    .once()
                                    .then((DataSnapshot snapshot) {
                                  Map<dynamic, dynamic> map = snapshot.value;
                                  String image = map.values.toList()[2][widget
                                      .auth.currentUser.uid]["photo"];
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeFeed(auth: widget.auth,
                                                code: widget.code,
                                                map: map,)));
                                });
                              } else {
                                showAlertDialog2(context);
                              }
                            },
                            backgroundColor: const Color(0xff1A2677),
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text("New Post"),
              backgroundColor: const Color(0xff1A2677),
            ),
            body: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(SizeConfig.screenWidth * 50,
                        SizeConfig.screenHeight * 270.0),
                    child: Text(multimediaLoaded, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                  ),
                  Transform.translate(
                      offset: Offset(SizeConfig.screenWidth * 50,
                          SizeConfig.screenHeight * 70.0),
                      child: SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: const Color(0xff1A2677), // button color
                            child: InkWell(
                              splashColor:
                                  const Color(0xff1A2677), // splash color
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet("photo")),
                                );
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.camera,
                                    color: Colors.white,
                                  ),
                                  // icon
                                  Text(
                                    "Add Photo",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                  // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                  Transform.translate(
                      offset: Offset(SizeConfig.screenWidth * 50,
                          SizeConfig.screenHeight * 90.0),
                      child: SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: const Color(0xff1A2677), // button color
                            child: InkWell(
                              splashColor:
                                  const Color(0xff1A2677), // splash color
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet("video")),
                                );
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.video,
                                    color: Colors.white,
                                  ),
                                  // icon
                                  Text(
                                    "Add Video",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                  // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                  Transform.translate(
                      offset: Offset(SizeConfig.screenWidth * 50,
                          SizeConfig.screenHeight * 190.0),
                      child: Container(
                        width: SizeConfig.screenWidth * 300.0,
                        child: TextFormField(
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          onChanged: (String value) async {
                            this.text = value;
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: const Color(0xff1A2677))),
                            hintText: 'Caption text',
                          ),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: const Color(0xff1A2677),
                            letterSpacing: 0.15,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )),
                  Transform.translate(
                    offset: Offset(SizeConfig.screenWidth * 50,
                        SizeConfig.screenHeight * 350.0),
                    child: Container(
                      child: InkWell(
                        onTap: () async {
                          if (text == "" && _multiFile == null) {
                            showAlertDialog(context);
                          } else {
                            insertDatabase().then((value) {
                              FirebaseDatabase.instance
                                  .reference()
                                  .once()
                                  .then((DataSnapshot snapshot) {
                                Map<dynamic, dynamic> map = snapshot.value;
                                String image = map.values.toList()[2]
                                    [widget.auth.currentUser.uid]["photo"];
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => HomeFeed(
                                              auth: widget.auth,
                                              code: widget.code,
                                              map: map,
                                            )));
                              });
                            });
                          }
                        },
                        child: SizedBox(
                          width: SizeConfig.screenWidth * 149.0,
                          height: SizeConfig.screenHeight * 57.0,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(
                                    0.0,
                                    0.0,
                                    SizeConfig.screenWidth * 149.0,
                                    SizeConfig.screenHeight * 57.0),
                                size: Size(SizeConfig.screenWidth * 149.0,
                                    SizeConfig.screenHeight * 57.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35.0),
                                    color: const Color(0xff1A2677),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xff1A2677)),
                                  ),
                                  child: SizedBox(
                                    width: SizeConfig.screenWidth * 88.0,
                                    child: Text(
                                      'POST',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 15,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 1.6909999999999998,
                                        height: 2,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  } // Widget build
} // StatelessWidget
