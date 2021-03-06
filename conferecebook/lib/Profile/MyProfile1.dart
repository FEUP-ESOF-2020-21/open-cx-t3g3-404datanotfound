import 'package:ConfereceBook/Profile/ConferenceHistory.dart';
import 'package:ConfereceBook/Profile/EditProfile.dart';
import 'package:ConfereceBook/Profile/MyProfile2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Feed/HomeFeed.dart';
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

class MyProfile1 extends StatefulWidget {
  MyProfile1(
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
  State<StatefulWidget> createState() => _MyProfile1();
}

class _MyProfile1 extends State<MyProfile1> {
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
  String code;
  FirebaseAuth auth;

  showTextDialog(BuildContext context, String text, String title) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Back'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    auth = widget.auth;
    image = widget.image;
    name = widget.name;
    job = widget.job;
    interests = widget.interests;
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
        // ignore: missing_return
        onWillPop: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Scaffold(
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
                offset: Offset(SizeConfig.screenWidth * 158.5,
                    SizeConfig.screenHeight * 290.0),
                child: SizedBox(
                  width: SizeConfig.screenWidth * 100.0,
                  child: Text(
                    this.city.trimRight().isEmpty
                        ? 'Undefined city'
                        : this.city,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: this.city.trimRight().isEmpty
                          ? const Color(0xffd3d3d3)
                          : const Color(0xff1A2677),
                      letterSpacing: 0.1875,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 430),
                child: Container(
                    width: 200,
                    height: 20,
                    child: Text(
                      bio.trimRight().isEmpty ? 'Undefined bio' : bio,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: bio.trimRight().isEmpty
                              ? const Color(0xffd3d3d3)
                              : const Color(0xff1A2677)),
                    )),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 376.5),
                child: Text(
                  'Biography',
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
                  offset: Offset(SizeConfig.screenWidth * 300,
                      SizeConfig.screenHeight * 430),
                  child: Container(
                      width: 190,
                      height: 20,
                      child: bio.length > 28
                          ? RichText(
                              text: TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'See More',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showTextDialog(
                                              context, bio, "Biography");
                                        }),
                                ],
                              ),
                            )
                          : Container())),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 530),
                child: Container(
                    width: 200,
                    height: 20,
                    child: Text(
                      job.trimRight().isEmpty ? 'Undefined job' : job,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: job.trimRight().isEmpty
                              ? const Color(0xffd3d3d3)
                              : const Color(0xff1A2677)),
                    )),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 476.5),
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
                  offset: Offset(SizeConfig.screenWidth * 300,
                      SizeConfig.screenHeight * 530),
                  child: Container(
                      width: 190,
                      height: 20,
                      child: job.length > 28
                          ? RichText(
                              text: TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'See More',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showTextDialog(context, job, "Job");
                                        }),
                                ],
                              ),
                            )
                          : Container())),
              Transform.translate(
                offset: Offset(
                    SizeConfig.screenWidth * 70, SizeConfig.screenHeight * 630),
                child: Container(
                    width: 200,
                    height: 20,
                    child: Text(
                      area.trimRight().isEmpty ? 'Undefined area' : area,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: area.trimRight().isEmpty
                              ? const Color(0xffd3d3d3)
                              : const Color(0xff1A2677)),
                    )),
              ),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 59.5,
                    SizeConfig.screenHeight * 576.5),
                child: Text(
                  'Area',
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
                  offset: Offset(SizeConfig.screenWidth * 300,
                      SizeConfig.screenHeight * 630),
                  child: Container(
                      width: 190,
                      height: 20,
                      child: area.length > 28
                          ? RichText(
                              text: TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'See More',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showTextDialog(context, area, "Area");
                                        }),
                                ],
                              ),
                            )
                          : Container())),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 80,
                    SizeConfig.screenHeight * 250.0),
                child: SizedBox(
                  width: 226.0,
                  child: Text(
                    this.name,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: this.name.length > 10 ? 20 : 30,
                      color: const Color(0xff1A2677),
                      letterSpacing: 0.28125,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    child: Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 75.0, right: 35.0),
                          child: FloatingActionButton(
                            onPressed: () async {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => MyProfile2(
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
                            },
                            backgroundColor: const Color(0xffededed),
                            elevation: 0,
                            child: Icon(
                              FontAwesomeIcons.arrowRight,
                              color: const Color(0xff1A2677),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
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
                            Navigator.of(context).pop();
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                          ), // icon
                        ),
                      ),
                    ),
                  )),
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 150,
                    SizeConfig.screenHeight * 100.0),
                child:
                    // Adobe XD layer: 'NoPath' (shape)
                    Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(this.image),
                    radius: 50,
                  ),
                ),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 43,
                      SizeConfig.screenHeight * 705),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xffededed), // button color
                        child: InkWell(
                          splashColor: const Color(0xffededed), // splash color
                          onTap: () async {
                            FirebaseDatabase.instance
                                .reference()
                                .once()
                                .then((DataSnapshot snapshot) {
                              Map<dynamic, dynamic> map = snapshot.value;
                              String user = auth.currentUser.uid;
                              this.image =
                                  map.values.toList()[2][user]["photo"];
                              this.name = map.values.toList()[2][user]["name"];
                              this.job = map.values.toList()[2][user]["job"];
                              this.interests =
                                  map.values.toList()[2][user]["interests"];
                              this.city = map.values.toList()[2][user]["city"];
                              this.bio = map.values.toList()[2][user]["bio"];
                              this.area = map.values.toList()[2][user]["area"];
                              this.linkedin =
                                  map.values.toList()[2][user]["linkedin"];
                              this.facebook =
                                  map.values.toList()[2][user]["facebook"];
                              this.instagram =
                                  map.values.toList()[2][user]["instagram"];
                              this.twitter =
                                  map.values.toList()[2][user]["twitter"];
                              this.github =
                                  map.values.toList()[2][user]["github"];
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ConferenceHistory(
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
                                            code: code,
                                            map: map,
                                          )));
                            });
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.history,
                            color: const Color(0xff1A2677),
                          ), // icon
                        ),
                      ),
                    ),
                  )),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 340,
                      SizeConfig.screenHeight * 20 + 20),
                  child: SizedBox.fromSize(
                    size: Size(56, 56), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: const Color(0xff1A2677), // button color
                        child: InkWell(
                          splashColor: const Color(0xff1A2677), // splash color
                          onTap: () async {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => EditProfile1(
                                        auth: widget.auth,
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
                          }, // button pressed
                          child: Icon(
                            FontAwesomeIcons.pencilAlt,
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
