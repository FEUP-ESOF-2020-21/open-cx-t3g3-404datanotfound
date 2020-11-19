import 'package:ConfereceBook/CreateProfile3.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ConfereceBook/Login.dart';

class CreateProfile2 extends StatefulWidget {
  CreateProfile2({Key key, this.auth, this.userId}) : super(key: key);

  final FirebaseAuth auth;
  // ignore: deprecated_member_use
  final String userId;

  @override
  State<StatefulWidget> createState() => MyProfileState2();
}

class MyProfileState2 extends State<CreateProfile2> {
  String name = "";
  String bio = "";
  String city = "";
  String areaOfWork = "";
  String currentJob = "";

  String userId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    userId = widget.userId;
    return WillPopScope(
    onWillPop: () async => false, child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Additional Information 1/3"),
          backgroundColor: const Color(0xff1A2677),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform.translate(
                offset: Offset(SizeConfig.screenWidth * 53.5,
                    SizeConfig.screenHeight * 50.0),
                child: Container(
                  width: SizeConfig.screenWidth * 270.0,
                  child: TextFormField(
                    onChanged: (String value) async {
                      this.name = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, color: const Color(0xff1A2677)),
                      hintText: 'Full Name',
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
                ),
              ),
              Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 53.5,
                      SizeConfig.screenHeight * 100.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.city = value;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.apartment_rounded,
                            color: const Color(0xff1A2677)),
                        hintText: 'City, Country',
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
                      SizeConfig.screenHeight * 150.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.currentJob = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.engineering,
                            color: const Color(0xff1A2677)),
                        hintText: 'Job',
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
                      SizeConfig.screenHeight * 200.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.areaOfWork = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.work, color: const Color(0xff1A2677)),
                        hintText: 'Area of Work',
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
                      SizeConfig.screenHeight * 250.0),
                  child: Container(
                    width: SizeConfig.screenWidth * 270.0,
                    child: TextFormField(
                      onChanged: (String value) async {
                        this.bio = value;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.info, color: const Color(0xff1A2677)),
                        hintText: 'Biography',
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
                    SizeConfig.screenHeight * 300.0),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateProfile3(auth: widget.auth, userId: userId, name: name, bio: bio,
                                      city: city, areaOfWork: areaOfWork, currentJob: currentJob)));

                    },
                    child: SizedBox(
                      width: SizeConfig.screenWidth * 149.0,
                      height: SizeConfig.screenHeight * 57.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                            size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
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
