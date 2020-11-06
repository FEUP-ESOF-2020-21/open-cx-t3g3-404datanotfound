import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './CreateProfile1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/widgets.dart';
import 'db/Database.dart';

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

class MyLogin extends StatefulWidget {
  MyLogin({Key key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<MyLogin> {
  String email;
  String password;
  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;
  bool submit = false;

  static Future<bool> checkLogin(String inputEmail, String inputPassword) async {
    var user = await DBProvider.db.getUser(inputEmail);
    var password = await DBProvider.db.getPassword(inputEmail);
    String myPassword = "[{password: " + inputPassword + "}]";
    // return true if user not null and inputPassword = SQL's password
    // return false if user null OR password different OR both
    if ((user != null) && (password.toString() == myPassword))
      return true;
    else
      return false;
  }

  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void move() {
    this.submit = true;
    checkLogin(this.email, this.password).then((value){
      if (this.submit && value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => JoinAnEvent()
        ));
      } else {
        this.submit = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Container(),
      Transform.translate(
          offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 400.0),
        child: Container(
            width: 270.0,
          child: TextField(
            controller: _controllerPassword,
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
        offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 300.0),
        child: Container(
        width: 270.0,
        child:
        TextField(
          controller: _controllerEmail,
          onChanged: (String value) async {
            this.email = value;
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
            offset: Offset(SizeConfig.screenWidth * 132.0, SizeConfig.screenHeight * 504.0),
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
            offset: Offset(SizeConfig.screenWidth * 168.8, SizeConfig.screenHeight * 520.0),
            child: InkWell(
              onTap: () {this.move();},
              child: SizedBox(
                width: 88.0,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    color: const Color(0xffffffff),
                    letterSpacing: 1.6909999999999998,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 613.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'New around here?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0x99000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 636.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => CreateProfile1(),
                ),
              ],
              child: Text(
                'Create account!',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xff1A2677),
                  letterSpacing: 0.15,
                  decoration: TextDecoration.underline,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 164.0, SizeConfig.screenHeight * 134.0),
            child: Image.asset('images/icon.png',
              height: 90.0,
              width: 90.0,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 135.0,SizeConfig.screenHeight * 829.0),
            child: SizedBox(
              width: SizeConfig.screenWidth * 144.0,
              child: Text(
                'ConferenceBook',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xff1A2677),
                  letterSpacing: 0.15,
                  height:SizeConfig.screenHeight * 1.5,
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

