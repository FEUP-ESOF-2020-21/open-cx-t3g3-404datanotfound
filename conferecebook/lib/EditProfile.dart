import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:ConfereceBook/MyProfile1.dart';
import 'package:ConfereceBook/MyProfile2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import './HomeFeed.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

import 'package:path/path.dart';

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

class EditProfile1 extends StatefulWidget {
  EditProfile1(
      {Key key,
      this.auth,
      this.image,
      this.name,
      this.job,
      this.interests,
      this.city,
      this.bio,
      this.area,
      this.facebook,
      this.instagram,
      this.linkedin,
      this.twitter,
      this.github,
      this.code})
      : super(key: key);

  final FirebaseAuth auth;
  final String image;
  final String name;
  final String job;
  final String interests;
  final String city;
  final String bio;
  final String area;
  final String facebook;
  final String instagram;
  final String linkedin;
  final String twitter;
  final String github;
  final String code;

  @override
  State<StatefulWidget> createState() => _EditProfile1();
}

class _EditProfile1 extends State<EditProfile1> {
  String image;
  String interests;
  String facebook;
  String instagram;
  String linkedin;
  String twitter;
  String github;
  String code;
  FirebaseAuth auth;
  String name;
  String job;
  String city;
  String bio;
  String area;

  TextEditingController bioController;
  TextEditingController jobController;
  TextEditingController areaController;
  TextEditingController nameController;
  TextEditingController cityController;

  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  Widget bottomSheet() {
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
      _imageFile = File(pickedFile.path);
    });
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

  check(BuildContext context) {
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
                  code: widget.code)));
        });
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Discard changes?"),
      content: Text("You've changed some of your profile information."),
      actions: [stay, leave],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  updateDataBase(BuildContext context) async {
    if (_imageFile != null) {
      String image = basename(_imageFile.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('profilePics/$image');
      UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      taskSnapshot.ref.getDownloadURL().then((value) async {
        String imageURL = value;
        DatabaseReference firebaseDatabaseRef =
            FirebaseDatabase.instance.reference().child('Users');
        firebaseDatabaseRef.child(widget.auth.currentUser.uid).update({
          'name': nameController.value.text,
          'area': areaController.value.text,
          'job': jobController.value.text,
          'bio': bioController.value.text,
          'city': cityController.value.text,
          'photo': imageURL,
        }).then((value) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MyProfile1(
                  auth: auth,
                  image: imageURL,
                  name: nameController.value.text,
                  job: jobController.value.text,
                  interests: interests,
                  city: cityController.value.text,
                  bio: bioController.value.text,
                  area: areaController.value.text,
                  linkedin: linkedin,
                  facebook: facebook,
                  instagram: instagram,
                  twitter: twitter,
                  github: github,
                  code: code)));
        });
      });
    } else {
      DatabaseReference firebaseDatabaseRef =
          FirebaseDatabase.instance.reference().child('Users');
      await firebaseDatabaseRef.child(widget.auth.currentUser.uid).update({
        'name': nameController.value.text,
        'area': areaController.value.text,
        'job': jobController.value.text,
        'bio': bioController.value.text,
        'city': cityController.value.text,
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyProfile1(
              auth: auth,
              image: image,
              name: nameController.value.text,
              job: jobController.value.text,
              interests: interests,
              city: cityController.value.text,
              bio: bioController.value.text,
              area: areaController.value.text,
              linkedin: linkedin,
              facebook: facebook,
              instagram: instagram,
              twitter: twitter,
              github: github,
              code: code)));
    }
  }

  @override
  void initState() {
    super.initState();
    bioController = TextEditingController(text: widget.bio);
    jobController = TextEditingController(text: widget.job);
    areaController = TextEditingController(text: widget.area);
    nameController = TextEditingController(text: widget.name);
    cityController = TextEditingController(text: widget.city);
  }

  @override
  void dispose() {
    bioController.dispose();
    jobController.dispose();
    areaController.dispose();
    nameController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    auth = widget.auth;
    image = widget.image;
    interests = widget.interests;
    facebook = widget.facebook;
    instagram = widget.instagram;
    linkedin = widget.linkedin;
    twitter = widget.twitter;
    github = widget.github;
    code = widget.code;
    name = widget.name;
    city = widget.city;
    area = widget.area;
    job = widget.job;
    bio = widget.bio;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: Align(
              alignment: FractionalOffset.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 52.0, right: 0.0),
                child: FloatingActionButton(
                  onPressed: () {
                    updateDataBase(context);
                  },
                  backgroundColor: const Color(0xff1A2677),
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: const Color(0xffffffff),
                  ),
                ),
              )),
          backgroundColor: const Color(0xffffffff),
          body: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 34.0,
                    SizeConfig.screenHeight * 150.0),
                child: Container(
                  width: SizeConfig.screenWidth * 345.0,
                  height: SizeConfig.screenHeight * 636.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color(0x80ececec),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 110.0,
                    SizeConfig.screenHeight * 64.0),
                child: Container(
                  width: SizeConfig.screenWidth * 194.0,
                  height: SizeConfig.screenHeight * 194.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0xfff5f5f5),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 79,
                    SizeConfig.screenHeight * 320.0),
                child: SizedBox(
                    width: SizeConfig.screenWidth * 260.0,
                    child: Container(
                      width: 260,
                      height: 20,
                      child: TextField(
                        controller: cityController,
                        onChanged: (String value) async {
                          city = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.1)),
                        ),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: const Color(0xff1A2677),
                          letterSpacing: 0.1875,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 70,
                      SizeConfig.screenHeight * 390),
                  child: Container(
                    width: 250,
                    child: TextField(
                      controller: bioController,
                      onChanged: (String value) async {
                        this.bio = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  )),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 365),
                child: Text(
                  'Bio',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 70,
                      SizeConfig.screenHeight * 495),
                  child: Container(
                    width: 250,
                    child: TextField(
                      controller: jobController,
                      onChanged: (String value) async {
                        job = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  )),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 470),
                child: Text(
                  'Job',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 70,
                      SizeConfig.screenHeight * 595),
                  child: Container(
                    width: 250,
                    child: TextField(
                      controller: areaController,
                      onChanged: (String value) async {
                        area = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero)),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  )),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 570),
                child: Text(
                  'Area',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 80,
                    SizeConfig.screenHeight * 230.0),
                child: SizedBox(
                  width: 226.0,
                  child: TextField(
                    controller: nameController,
                    onChanged: (String value) async {
                      name = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      color: const Color(0xff1A2677),
                      letterSpacing: 0.28125,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 150,
                    SizeConfig.screenHeight * 100.0),
                child:
                    // Adobe XD layer: 'NoPath' (shape)
                    Container(
                        child: Stack(children: <Widget>[
                  CircleAvatar(
                    backgroundImage: _imageFile == null
                        ? NetworkImage(this.image)
                        : FileImage(File(_imageFile.path)),
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 35.0,
                    right: 55.0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.retweet,
                        color: const Color(0xffffffff),
                        size: 30.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35.0,
                    right: 15.0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.camera,
                        color: const Color(0xffffffff),
                        size: 30.0,
                      ),
                    ),
                  ),
                ])),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 10,
                      SizeConfig.screenHeight * 20 + 20),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xff1A2677), // button color
                        child: InkWell(
                          splashColor: const Color(0xff1A2677), // splash color
                          onTap: () async {
                            if ((name != nameController.value.text) ||
                                (city != cityController.value.text) ||
                                (area != areaController.value.text) ||
                                (job != jobController.value.text) ||
                                (bio != bioController.value.text)) {
                              check(context);
                            } else {
                              FirebaseDatabase.instance
                                  .reference()
                                  .once()
                                  .then((DataSnapshot snapshot) {
                                Map<dynamic, dynamic> map = snapshot.value;
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
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
                                            code: widget.code)));
                              });
                            }
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.times,
                            color: Colors.white,
                          ), // icon
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

const String _svg_2rnm7d =
    '<svg viewBox="0.0 0.0 45.0 45.0" ><path  d="M 0 0 L 45 0 L 45 45 L 0 45 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_35bab1 =
    '<svg viewBox="7.5 7.5 30.0 30.0" ><path transform="translate(3.5, 3.5)" d="M 34 17.125 L 11.18124961853027 17.125 L 21.66250038146973 6.643749237060547 L 19 4 L 4 19 L 19 34 L 21.64374923706055 31.35625076293945 L 11.18124961853027 20.875 L 34 20.875 L 34 17.125 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ieldpp =
    '<svg viewBox="18.5 29.5 30.0 30.0" ><path transform="translate(14.5, 25.5)" d="M 34 17.125 L 11.18124961853027 17.125 L 21.66250038146973 6.643749237060547 L 19 4 L 4 19 L 19 34 L 21.64374923706055 31.35625076293945 L 11.18124961853027 20.875 L 34 20.875 L 34 17.125 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1n72gt =
    '<svg viewBox="335.0 181.0 21.0 21.0" ><path transform="translate(335.0, 181.0)" d="M 4.375298976898193 21.00270080566406 L 4.373642444610596 21.00104522705078 L 4.373980522155762 21.00070571899414 L 3.869628812935844e-07 21.00270080566406 L 3.869628812935844e-07 16.6274356842041 L 12.90329837799072 3.724238634109497 L 17.27859687805176 8.099503517150879 L 4.375298976898193 21.00270080566406 Z M 18.52598190307617 6.851066112518311 L 18.52515411376953 6.850249290466309 L 14.1517333984375 2.475812911987305 L 16.2863597869873 0.341204822063446 C 16.50623893737793 0.1213274374604225 16.79825019836426 0.0002298022736795247 17.10862731933594 0.0002298022736795247 C 17.41899108886719 0.0002298022736795247 17.71129608154297 0.1213274374604225 17.93168830871582 0.341204822063446 L 20.66165733337402 3.071151256561279 C 21.1147632598877 3.524240732192993 21.1147632598877 4.262330055236816 20.66165733337402 4.716469764709473 L 18.52680969238281 6.850249290466309 L 18.52598190307617 6.851066112518311 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m4odhz =
    '<svg viewBox="0.0 0.0 39.7 39.7" ><path  d="M 0 0 L 39.66665649414063 0 L 39.66665649414063 39.66665649414063 L 0 39.66665649414063 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lubbn0 =
    '<svg viewBox="3.3 5.0 33.1 28.1" ><path transform="translate(1.31, 1.96)" d="M 15.22221851348877 31.09721374511719 L 15.22221851348877 21.18054962158203 L 21.83332633972168 21.18054962158203 L 21.83332633972168 31.09721374511719 L 30.09721374511719 31.09721374511719 L 30.09721374511719 17.87499618530273 L 35.05554580688477 17.87499618530273 L 18.52777290344238 3 L 1.99999988079071 17.87499618530273 L 6.95833158493042 17.87499618530273 L 6.95833158493042 31.09721374511719 L 15.22221851348877 31.09721374511719 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
