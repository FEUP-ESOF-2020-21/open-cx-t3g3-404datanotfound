import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:ConfereceBook/Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './CreateProfile1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/widgets.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

class MyResetPassword extends StatefulWidget {
  MyResetPassword({Key key, this.auth}) : super(key: key);

  final FirebaseAuth auth;

  @override
  _MyResetPassword createState() => _MyResetPassword();
}

class _MyResetPassword extends State<MyResetPassword> {
  FirebaseAuth auth;
  String email;
  String password;

  sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        showAlertDialog2(context);
      });
    } catch (e) {
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Invalid Email"),
      content:
          Text("The e-mail you entered is not associated with any account."),
      actions: [
        okButton,
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

  showAlertDialog2(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MyLogin(
                  auth: auth,
                )));
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Check your e-mail"),
      content:
          Text("You will receive shortly an e-mail to reset your password"),
      actions: [
        okButton,
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
    auth = widget.auth;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(
                SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 350.0),
            child: Container(
              width: 270.0,
              child: TextField(
                onChanged: (String value) async {
                  this.email = value.trim();
                },
                obscureText: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: const Color(0xff1A2677)),
                  hintText: 'E-mail',
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
            offset: Offset(SizeConfig.screenWidth * 132.0,
                SizeConfig.screenHeight * 504.0),
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
                        color: const Color(0xff1A2677),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff1A2677)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 133,
                  SizeConfig.screenHeight * 520.0),
              child: InkWell(
                  onTap: () {
                    sendPasswordResetEmail(email);
                  },
                  child: SizedBox(
                    width: 150.0,
                    child: Text('RESET',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 25,
                          color: const Color(0xffffffff),
                          letterSpacing: 1.6909999999999998,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center),
                  ))),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 164.0,
                SizeConfig.screenHeight * 134.0),
            child: Image.asset(
              'images/icon.png',
              height: 90.0,
              width: 90.0,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 135.0,
                SizeConfig.screenHeight * 829.0),
            child: SizedBox(
              width: SizeConfig.screenWidth * 144.0,
              child: Text(
                'ConferenceBook',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xff1A2677),
                  letterSpacing: 0.15,
                  height: SizeConfig.screenHeight * 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
