import 'dart:core';

import 'package:ConfereceBook/Login.dart';
import 'package:ConfereceBook/MyProfile1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_tag_editor/tag_editor.dart';
import './HomeFeed.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:page_transition/page_transition.dart';
import 'MyProfile2.dart';

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

class EditProfile2 extends StatefulWidget {
  EditProfile2(
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
  final String bio;
  final String area;
  final String interests;
  final String city;
  final String facebook;
  final String instagram;
  final String linkedin;
  final String twitter;
  final String github;
  final String code;

  @override
  State<StatefulWidget> createState() => _EditProfile2();
}

class _EditProfile2 extends State<EditProfile2> {
  FirebaseAuth auth;
  String image;
  String name;
  String job;
  String interests;
  String city;
  String bio;
  String area;
  String facebook;
  String instagram;
  String linkedin;
  String twitter;
  String github;
  List<String> values = []; // for tags
  String _interests = ""; // for new interests
  String code;


  TextEditingController _textFieldController = TextEditingController();

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  // Allows you to get a list of all the ItemTags
  _getAllItem() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if (lst != null)
      lst.where((a) => a.active == true).forEach((a) => print(a.title));
  }

  showAlertDialog(BuildContext context, String text) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta;

    alerta = AlertDialog(
      title: Text("Oops..."),
      content: Text(name.trimRight() + " doesn't have a " + text + " account."),
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

  updateDataBase(BuildContext context, String socialNetwork, String newNickname) async {

      socialNetwork = socialNetwork.toLowerCase();

      switch (socialNetwork) {
        case "facebook":
          facebook = newNickname;
          break;

        case "instagram":
          instagram = newNickname;
          break;

        case "twitter":
          twitter = newNickname;
          break;

        case "github":
          github = newNickname;
          break;

        case "linkedin":
          linkedin = newNickname;
          break;
      }

        DatabaseReference firebaseDatabaseRef =
        FirebaseDatabase.instance.reference().child('Users');

        firebaseDatabaseRef.child(widget.auth.currentUser.uid)
            .child(socialNetwork)
            .set(newNickname)
            .then((value) {

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => EditProfile2(
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
  }

  showTextEditDialog(BuildContext context, String socialNetwork) async {
    String attribute = socialNetwork.toLowerCase();
    String textHint;

    switch (attribute) {
      case "facebook":
        textHint = facebook;
        break;

      case "instagram":
        textHint = instagram;
        break;

      case "twitter":
        textHint = twitter;
        break;

      case "github":
        textHint = github;
        break;

      case "linkedin":
        textHint = linkedin;
        break;
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Edit here your nickname for $socialNetwork"),
              content: TextField(
                controller: _textFieldController,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: textHint),
              ),
              actions: <Widget>[
                new FlatButton(
                    child : new Text('Back'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                new FlatButton(
                    child: new Text('Confirm'),
                    onPressed: () async {
                      updateDataBase(context, socialNetwork, _textFieldController.text);
                    }),

              ]);
        });
  }


  onDelete(index) {
    setState(() {
      values.removeAt(index);
    });
  }

  dbToString() {
    if (values.isNotEmpty) {
      this._interests = values[0];
      for (int i = 1; i < values.length; i++) {
        this._interests += "," + values[i];
      }
    }

  }

  @override
  void initState(){
    super.initState();
    interests = widget.interests;
    values = interests.split(',').toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    auth = widget.auth;
    image = widget.image;
    name = widget.name;
    job = widget.job;
    city = widget.city;
    bio = widget.bio;
    area = widget.area;
    facebook = widget.facebook;
    instagram = widget.instagram;
    linkedin = widget.linkedin;
    twitter = widget.twitter;
    github = widget.github;
    code = widget.code;


    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          floatingActionButton: Align(
          alignment: Alignment(1.04,-0.84),
          child: FloatingActionButton(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, right: 0.0),
                      child: Icon(
                        FontAwesomeIcons.check,
                        color: const Color(0xffffffff),
                      )),
                  backgroundColor: const Color(0xff1A2677),
                  onPressed: () {
                    dbToString();
                    print(_interests);
                    DatabaseReference firebaseDatabaseRef =
                    FirebaseDatabase.instance.reference().child('Users');

                    firebaseDatabaseRef.child(widget.auth.currentUser.uid)
                        .child("interests")
                        .set(_interests)
                        .then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              MyProfile2(
                                  auth: auth,
                                  image: image,
                                  name: name,
                                  job: job,
                                  interests: _interests,
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

              Container(
                padding: EdgeInsets.only(top: 670 * SizeConfig.screenHeight, right: 90, left: 90),
                child: Text(
                  'Tap the Icons to edit',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                  padding: EdgeInsets.only(top: 700 * SizeConfig.screenHeight, right: 50, left: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.linkedin,
                              color: const Color(0xff1A2677)),
                          onPressed: () async {
                            showTextEditDialog(context, "LinkedIn");
                            }
                          ),

                        IconButton(
                                  icon: Icon(FontAwesomeIcons.twitter,
                                      color: const Color(0xff1A2677)),
                                  onPressed: () async {
                                    showTextEditDialog(context, "Twitter");
                                  }),

                        IconButton(
                                    icon: Icon(FontAwesomeIcons.github,
                                        color: const Color(0xff1A2677)),
                                    onPressed: () async {
                                      showTextEditDialog(context, "GitHub");
                                    }),

                        IconButton(
                                  icon: Icon(FontAwesomeIcons.instagram,
                                      color: const Color(0xff1A2677)),
                                  onPressed: () async {
                                    showTextEditDialog(context, "Instagram");
                                  }),

                        IconButton(
                          icon: Icon(FontAwesomeIcons.facebook,
                              color: const Color(0xff1A2677)),
                          onPressed: () async {
                            showTextEditDialog(context, "Facebook");
                          }),

                      ])),

              Container(
                padding: EdgeInsets.only(top: 220, right: 100, left: 100),
                child: Text(
                  'Edit your interests',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.36,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 280, left: 70, right:70),
                child: TagEditor(
                  length: values.length,
                  delimiters: [',', ' '],
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
                    index: index ,
                    label: values[index],
                    onDeleted: onDelete,
                  ),
                ),

              ),

              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 150,
                    SizeConfig.screenHeight * 100.0),
                child: // Adobe XD layer: 'NoPath' (shape)
                  Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(this.image),
                    radius: 50,
                  ),
                ),
              ),


          ]),
        ));
  }
}

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
