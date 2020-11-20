import 'dart:io';
import 'dart:async';

import 'package:ConfereceBook/CreateProfile2.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:material_tag_editor/tag_editor.dart';

import './Login.dart';


class CreateProfile1 extends StatefulWidget{
  CreateProfile1({Key key, this.auth}) : super(key: key);

  final FirebaseAuth auth;

  @override
  State<StatefulWidget> createState() =>
      MyProfileState();
}

class MyProfileState extends State<CreateProfile1>{

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  showAlertDialog1(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Existing account"),
      content: Text("The email address is already in use by another account"),
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

  showAlertDialog2(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Invalid Password"),
      content: Text("Password should be at least 6 characters"),
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

  showAlertDialog3(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Invalid E-mail"),
      content: Text("Please insert a valid email"),
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

  showAlertDialog0(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Empty field"),
      content: Text("Please fill the e-mail and password fields"),
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

  // ignore: missing_return
  Future<String> _register() async {
    // ignore: deprecated_member_use
    try {
      final User user = (await widget.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
      ).user;
      userId = user.uid;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
        return "";
      } else {
        setState(() {
          _success = true;
        });
        return "";
      }

    } catch (e) {
      print(e.toString());
      if (e.toString() == '[firebase_auth/weak-password] Password should be at least 6 characters') {
        return "Password";
      } else if (e.toString() == '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        return "Email";
      } else if (e.toString() == '[firebase_auth/invalid-email] The email address is badly formatted.') {
        return "Email format";
      } else {
        return "Other error";
      }
    }}

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String userId;
  bool _success;
  String _userEmail;
  FirebaseAuth auth;

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("New Account"),
        backgroundColor: const Color(0xff1A2677),
      ),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 164.0,
                SizeConfig.screenHeight * 50.0),
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
                  offset: Offset(
                      SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 300.0),
                  child: Container(
                    width: 270.0,
                    child: TextFormField(
                      controller: _passwordController,
                      onChanged: (String value) async {
                        this.password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock, color: const Color(0xff1A2677)),
                        hintText: 'Password',
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
                    offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 150.0),
                    child: Container(
                      width: 270.0,
                      child: TextFormField(
                        controller: _emailController,
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
                      ),)),
                Transform.translate(
                  offset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight * 300.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          _register().then((value) {
                            if ((this.email == "") || (this.password == "")) {
                              showAlertDialog0(context);
                            } else if (value == "Email") {
                              showAlertDialog1(context);
                            } else if (value == "Password") {
                              showAlertDialog2(context);
                            } else if (value == "Email format") {
                              showAlertDialog3(context);
                            } else {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => CreateProfile2(auth: auth, userId: userId)
                              ));
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
                                  color: const Color(0xff1A2677),
                                  border: Border.all(
                                      width: 1.0, color: const Color(0xff1A2677)),
                                ),
                                child: SizedBox(
                                  width: 88.0,
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
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
                  ),),
                Transform.translate(
                  offset: Offset(SizeConfig.screenWidth * 135.0,
                      SizeConfig.screenHeight * 460.0),
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
          ),
        ],
      )
    );
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