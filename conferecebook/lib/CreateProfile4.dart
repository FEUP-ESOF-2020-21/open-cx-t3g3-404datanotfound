import 'dart:io';
import 'dart:async';

import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';

class CreateProfile4 extends StatefulWidget {
  CreateProfile4(
      {Key key,
      this.auth,
      this.userId,
      this.name,
      this.areaOfWork,
      this.currentJob,
      this.bio,
      this.city,
      this.interests,
      this.imageFile})
      : super(key: key);

  final FirebaseAuth auth;
  final String userId;
  final String name;
  final String bio;
  final String city;
  final String areaOfWork;
  final String currentJob;
  final String interests;
  final File imageFile;

  @override
  State<StatefulWidget> createState() => MyProfileState4();
}

class MyProfileState4 extends State<CreateProfile4> {
  String userId;

  String facebook;
  String twitter;
  String instagram;
  String linkedin;
  String github;
  String imageURL;

  Future insertDataBase() async {
    String image = basename(widget.imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$image');
    UploadTask uploadTask = firebaseStorageRef.putFile(widget.imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    taskSnapshot.ref.getDownloadURL().then((value) {
      imageURL = value;
      DatabaseReference firebaseDatabaseRef =
          FirebaseDatabase.instance.reference().child('Users');
      firebaseDatabaseRef.child(this.userId).set({
        'name': widget.name,
        'area': widget.areaOfWork,
        'job': widget.currentJob,
        'bio': widget.bio,
        'city': widget.city,
        'interests': widget.interests,
        'photo': imageURL,
        'facebook': facebook,
        'twitter': twitter,
        'instagram': instagram,
        'linkedin': linkedin,
        'github': github,
      });
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    userId = widget.userId;
    return WillPopScope(
    onWillPop: () async => false, child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Additional Information 3/3"),
          backgroundColor: const Color(0xff1A2677),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 53.5,
                      SizeConfig.screenHeight * 100.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.facebook = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: new Icon(FontAwesomeIcons.facebook,
                            color: const Color(0xff1A2677)),
                        hintText: 'Facebook',
                        border: InputBorder.none,
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
                  offset: Offset(SizeConfig.screenWidth * 53.5,
                      SizeConfig.screenHeight * 120.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.instagram = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.instagram,
                            color: const Color(0xff1A2677)),
                        hintText: 'Instagram',
                        border: InputBorder.none,
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
                  offset: Offset(SizeConfig.screenWidth * 53.5,
                      SizeConfig.screenHeight * 140.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.twitter = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.twitter,
                            color: const Color(0xff1A2677)),
                        hintText: 'Twitter',
                        border: InputBorder.none,
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
                  offset: Offset(SizeConfig.screenWidth * 53.5,
                      SizeConfig.screenHeight * 160.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.linkedin = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.linkedin,
                            color: const Color(0xff1A2677)),
                        hintText: 'LinkedIn',
                        border: InputBorder.none,
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
                  offset: Offset(SizeConfig.screenWidth * 53.5,
                      SizeConfig.screenHeight * 180.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.github = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.github,
                            color: const Color(0xff1A2677)),
                        hintText: 'Github',
                        border: InputBorder.none,
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
                offset: Offset(SizeConfig.screenWidth * 120,
                    SizeConfig.screenHeight * 250.0),
                child: Container(
                  child: InkWell(
                    onTap: () async {
                      insertDataBase().then((value) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyLogin(auth: widget.auth)));
                      });
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
                                    width: 1.0, color: const Color(0xff1A2677)),
                              ),
                              child: SizedBox(
                                width: SizeConfig.screenWidth * 88.0,
                                child: Text(
                                  'NEXT',
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

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
