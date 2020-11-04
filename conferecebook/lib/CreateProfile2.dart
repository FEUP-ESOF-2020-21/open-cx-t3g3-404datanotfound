import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './HomeFeed.dart';
import 'package:adobe_xd/page_link.dart';
import './CreateProfile1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:ConfereceBook/db/UserModel.dart';
import 'package:ConfereceBook/db/Database.dart';


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

class CreateProfile2 extends StatelessWidget {
  CreateProfile2({
    Key key,
  }) : super(key: key);

  Map<String, String> newUser = {};
  Future _userFuture;

  void initState(){
    _userFuture = getLastUser();
  }

  getLastUser() async{
    final _userData = await DBProvider.db.getAllUsers();
    return _userData;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(title:Text("Create Account"), backgroundColor: const Color(0xff1A2677)),
      body: FutureBuilder(
        future: _userFuture,
        builder: (_, userData) {
          switch (userData.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Container();
            case ConnectionState.active:
            case ConnectionState.done:
              if(!newUser.containsKey('username')) {
                newUser = Map<String, String>.from(userData.data);
              }
          }
          if (!newUser.containsKey('username')) {
            newUser = Map<String, String>.from(userData.data);
          }
          return Column(children: <Widget>[
            Text(
              newUser['email'],
            ),
            Text(
              newUser['password'],
            )

          ]);


          return Container();
        }
      ),
    );
  } // Widget build
} // StatelessWidget