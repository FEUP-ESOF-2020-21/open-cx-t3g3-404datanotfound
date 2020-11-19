import 'package:ConfereceBook/HomeFeed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

import 'dart:async';

import 'package:ConfereceBook/CreateProfile2.dart';

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

class EnterEventCode extends StatefulWidget{
  EnterEventCode({Key key, this.auth}) : super(key: key);

  final FirebaseAuth auth;

  @override
  State<StatefulWidget> createState() =>
      EventCode();
}

class EventCode extends State<EnterEventCode>{

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context, String text) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta;
    if (text == "Error") {
      alerta = AlertDialog(
        title: Text("Invalid Event Code"),
        content: Text("The event code is invalid. Please try again."),
        actions: [
          okButton,
        ],
      );
    } else if (text == "Empty") {
      alerta = AlertDialog(
        title: Text("Empty Field"),
        content: Text("The event code field is empty."),
        actions: [
          okButton,
        ],
      );
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  String code = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  String userId;
  bool _success = false;
  FirebaseAuth auth;

  // ignore: missing_return
  Future<String> _register() async {
    await FirebaseDatabase.instance
        .reference()
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> map = snapshot.value;
      int length = map.values.toList()[0].length;
      for (int i = 1; i <= length; i++) {
        String aux = "id" + i.toString();
        String codes = map.values.toList()[0][aux]["code"];
        if (codes == this.code) {
          _success = true;
        }
      }
  });
    return _success == true ? "" : "Error";
  }

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    SizeConfig().init(context);
    return WillPopScope(
    onWillPop: () async => false, child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: const Color(0xff1A2677),
        body: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 164.0,
                  SizeConfig.screenHeight * 150.0),
              child: Image.asset('images/icon.png',
                width: SizeConfig.screenWidth * 90.0,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Transform.translate(
                      offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 350.0),
                      child: Container(
                        width: 270.0,
                        child: TextFormField(
                          controller: _codeController,
                          onChanged: (String value) async {
                            this.code = value;
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.code, color: const Color(0xffffffff)),
                            hintText: 'Event Code',
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: const Color(0xff1A2677),
                            letterSpacing: 0.15,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),)),
                  Transform.translate(
                    offset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight * 450.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            _register().then((value) {
                              if (this.code == "" ) {
                                showAlertDialog(context, "Empty");
                              } else if (value == "Error") {
                                showAlertDialog(context, "Error");
                              } else {
                                FirebaseDatabase.instance
                                    .reference()
                                    .once()
                                    .then((DataSnapshot snapshot) {
                                  Map<dynamic, dynamic> map = snapshot.value;
                                  String image = map.values.toList()[1][auth.currentUser.uid]["photo"];
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          HomeFeed(auth: this.auth, image: image, code: code)));
                                });
                              }
                            });
                          }
                        },
                        child: SizedBox(
                          width: 149.0,
                          height: 57.0,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 149.0, 57.0),
                                size: Size(149.0, 57.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35.0),
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        width: 1.0, color: const Color(0xffffffff)),
                                  ),
                                  child: SizedBox(
                                    width: 88.0,
                                    child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                        color: const Color(0xff1A2677),
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
                    ),),
                  Transform.translate(
                    offset: Offset(SizeConfig.screenWidth * 135.0,
                        SizeConfig.screenHeight * 650.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * 144.0,
                      child: Text(
                        'ConferenceBook',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.15,
                          height: SizeConfig.screenHeight * 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
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

const String _svg_755e5l =
    '<svg viewBox="0.0 0.0 35.0 35.0" ><path  d="M 0 0 L 35 0 L 35 35 L 0 35 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sub2yt =
    '<svg viewBox="5.8 5.8 23.3 23.3" ><path transform="translate(1.83, 1.83)" d="M 15.66666698455811 4 L 13.61041831970215 6.056249618530273 L 21.74791717529297 14.20833396911621 L 4 14.20833396911621 L 4 17.125 L 21.74791717529297 17.125 L 13.61041831970215 25.27708435058594 L 15.66666698455811 27.33333396911621 L 27.33333396911621 15.66666698455811 L 15.66666698455811 4 Z" fill="#1a2677" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
