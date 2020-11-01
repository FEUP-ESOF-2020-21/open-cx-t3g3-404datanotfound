import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Login.dart';
import 'package:adobe_xd/page_link.dart';
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
class AppOpening extends StatelessWidget {
  AppOpening({
    Key key,
  }) : super(key: key);
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
            offset: Offset(SizeConfig.screenWidth * 168.0, SizeConfig.screenHeight * 678.0),
            child:
            // Adobe XD layer: '✏️ Input text' (text)
            Text(
              'Let\'s start!',
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
            offset: Offset(SizeConfig.screenWidth * 168.0, SizeConfig.screenHeight * 624.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shadowColor: MaterialStateProperty.all<Color>(Colors.white),
                overlayColor: MaterialStateProperty.all<Color>(Colors.white),
                ),

              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 45.0, 45.0),
                      size: Size(45.0, 45.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_2rnm7d,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(7.5, 7.5, 30.0, 30.0),
                      size: Size(45.0, 45.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_2oyv8c,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 64.0, SizeConfig.screenHeight * 122.0),
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 60,
                color: const Color(0x99000000),
                letterSpacing: 0.5625,
                height: SizeConfig.screenHeight * 0.4,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 140.0, SizeConfig.screenHeight * 281.0),
            child: Image.asset('images/icon.png',
                height: 132.0,
                width: 132.0,
            ),

            ),

          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 36.5, SizeConfig.screenHeight * 470.0),
            child: SizedBox(
              width: 324.0,
              child: Text(
                'ConferenceBook',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  color: const Color(0x99000000),
                  letterSpacing: 0.33749999999999997,
                  height: SizeConfig.screenHeight * 0.6666666666666666,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );

    return Image(image: AssetImage('graphics/icon.png'));
  }
}

const String _svg_2rnm7d =
    '<svg viewBox="0.0 0.0 45.0 45.0" ><path  d="M 0 0 L 45 0 L 45 45 L 0 45 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2oyv8c =
    '<svg viewBox="7.5 7.5 30.0 30.0" ><path transform="translate(3.5, 3.5)" d="M 19 4 L 16.35625076293945 6.643749237060547 L 26.81875038146973 17.125 L 4 17.125 L 4 20.875 L 26.81875038146973 20.875 L 16.35625076293945 31.35625076293945 L 19 34 L 34 19 L 19 4 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
