import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './HomeFeed.dart';
import 'package:adobe_xd/page_link.dart';
import './MyProfile2.dart';
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

class MyProfile1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MyProfileState();
  }
}

class MyProfileState extends State<MyProfile1>{



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("Sign Up")),
      body: Container(
        margin: EdgeInsets.all(24),
      ),
    );
  }
}