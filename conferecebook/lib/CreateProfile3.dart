import 'dart:io';
import 'dart:async';

import 'package:ConfereceBook/CreateProfile4.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_tag_editor/tag_editor.dart';

class CreateProfile3 extends StatefulWidget {
  CreateProfile3({Key key, this.auth, this.userId,  this.name,
    this.areaOfWork,
    this.currentJob,
    this.bio,
    this.city,}) : super(key: key);

  final FirebaseAuth auth;
  final String userId;
  final String name;
  final String bio;
  final String city;
  final String areaOfWork;
  final String currentJob;

  @override
  State<StatefulWidget> createState() => MyProfileState3();
}

class MyProfileState3 extends State<CreateProfile3> {
  String userId;

  String _interests = "";
  List<String> values = []; // for tags

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  dbToString() {
    if (values.isNotEmpty) {
      _interests = values[0];
      for (int i = 1; i < values.length; i++) {
        _interests += "," + values[i];
      }
    }
  } // convert array of interests to string so save on DB

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile Photo',
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
                takePhoto(ImageSource.camera);
              },
              label: Text('Camera'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text('Gallery'),
            ),
          ]),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  onDelete(index) {
    setState(() {
      values.removeAt(index);
    });
  } // helper method to _buildInterests

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    userId = widget.userId;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Additional Information 2/3"),
          backgroundColor: const Color(0xff1A2677),
        ),
        body: Form(
            key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(SizeConfig.screenWidth * 130,
                        SizeConfig.screenHeight * 100.0),
                    child: Stack(children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: _imageFile == null
                            ? AssetImage('images/mark.jpeg') //default image
                            : FileImage(File(_imageFile.path)),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: const Color(0xff1A2677),
                            size: 28.0,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Transform.translate(
                      offset: Offset(SizeConfig.screenWidth * 53.5,
                          SizeConfig.screenHeight * 150.0),
                      child: TagEditor(
                        length: values.length,
                        delimeters: [',', ' '],
                        hasAddButton: false,
                        inputDecoration: const InputDecoration(
                          //helperText: 'Add your Interests',
                          hintText: 'Add your Interests',
                          border: InputBorder.none,
                        ),
                        onTagChanged: (newValue) {
                          setState(() {
                            values.add(newValue);
                          });
                        },
                        tagBuilder: (context, index) => _Chip(
                          index: index,
                          label: values[index],
                          onDeleted: onDelete,
                        ),
                      )),
                  Transform.translate(
                    offset: Offset(SizeConfig.screenWidth * 120,
                        SizeConfig.screenHeight * 300.0),
                    child: Container(
                      child: InkWell(
                        onTap: () {
                            dbToString();
                            if (_imageFile == null) _imageFile = PickedFile('images/mark.jpeg');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateProfile4(auth: widget.auth, userId: userId, name: widget.name, bio: widget.bio, city: widget.city,
                                        areaOfWork: widget.areaOfWork, currentJob: widget.currentJob, imageFile: _imageFile.path, interests: _interests,)));
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
            ));
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
