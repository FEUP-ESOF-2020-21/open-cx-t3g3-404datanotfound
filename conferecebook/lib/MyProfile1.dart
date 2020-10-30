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

class MyProfile1 extends StatelessWidget {
  MyProfile1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(33.0, 150.0),
            child: Container(
              width: 345.0,
              height: 640.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0x80ececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(109.0, 69.0),
            child: Container(
              width: 194.0,
              height: 194.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 1.0, color: const Color(0xffffffff)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(11.0, 22.0),
            child:
                // Adobe XD layer: 'arrow_back-24px' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => HomeFeed(),
                ),
              ],
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
                        _svg_35bab1,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(349.3, 24.3),
            child:
                // Adobe XD layer: 'home-24px' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => HomeFeed(),
                ),
              ],
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 39.7, 39.7),
                      size: Size(39.7, 39.7),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_m4odhz,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(3.3, 5.0, 33.1, 28.1),
                      size: Size(39.7, 39.7),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_lubbn0,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(93.7, 274.0),
            child: SizedBox(
              width: 226.0,
              child: Text(
                'Albert Peralta',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  color: const Color(0xff666666),
                  letterSpacing: 0.28125,
                  fontWeight: FontWeight.w500,
                  height: 0.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(324.0, 729.0),
            child:
                // Adobe XD layer: 'arrow_forward-24px' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => MyProfile2(),
                ),
              ],
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
            ),
          ),
          Transform.translate(
            offset: Offset(62.5, 401.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'Software Engineer from Porto, 21 years\nold, enthusiast about Machine Learning,\nCars and Politics ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xbc000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(62.5, 375.5),
            child: Text(
              'Bio',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: const Color(0xff670aec),
                letterSpacing: 0.36,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(62.0, 519.0),
            child:
                // Adobe XD layer: 'work-24px' (group)
                SizedBox(
              width: 31.0,
              height: 31.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 30.5, 30.5),
                    size: Size(30.5, 30.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_l505wp,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(2.5, 2.5, 25.4, 24.1),
                    size: Size(30.5, 30.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_mmlnuf,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(101.5, 524.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'Software Engineer at BLIP',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xbc000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(62.5, 401.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'Software Engineer from Porto, 21 years\nold, enthusiast about Machine Learning,\nCars and Politics ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xbc000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(62.5, 401.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'Software Engineer from Porto, 21 years\nold, enthusiast about Machine Learning,\nCars and Politics ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xbc000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(61.0, 564.0),
            child:
                // Adobe XD layer: 'school-24px' (group)
                SizedBox(
              width: 34.0,
              height: 34.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 33.5, 33.5),
                    size: Size(33.5, 33.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_n9zhef,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(1.4, 4.2, 30.7, 25.1),
                    size: Size(33.5, 33.5),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_1d3x21,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(102.5, 569.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'Biomedical Engineering at FEUP',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xbc000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(63.0, 612.0),
            child:
                // Adobe XD layer: 'event-24px' (group)
                SizedBox(
              width: 31.0,
              height: 32.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 31.5, 32.0),
                    size: Size(31.5, 32.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_yf5gdb,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(4.4, 1.5, 22.6, 26.1),
                    size: Size(31.5, 32.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_p101d6,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(102.5, 614.0),
            child:
                // Adobe XD layer: '✏️ Input text' (text)
                Text(
              'Participant of 23 past events',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xbc000000),
                letterSpacing: 0.15,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(102.0, 659.0),
            child: Container(
              width: 135.0,
              height: 65.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(246.0, 659.0),
            child: Container(
              width: 65.0,
              height: 65.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(335.0, 181.0),
            child: SvgPicture.string(
              _svg_1n72gt,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_2rnm7d =
    '<svg viewBox="0.0 0.0 45.0 45.0" ><path  d="M 0 0 L 45 0 L 45 45 L 0 45 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_35bab1 =
    '<svg viewBox="7.5 7.5 30.0 30.0" ><path transform="translate(3.5, 3.5)" d="M 34 17.125 L 11.18124961853027 17.125 L 21.66250038146973 6.643749237060547 L 19 4 L 4 19 L 19 34 L 21.64374923706055 31.35625076293945 L 11.18124961853027 20.875 L 34 20.875 L 34 17.125 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m4odhz =
    '<svg viewBox="0.0 0.0 39.7 39.7" ><path  d="M 0 0 L 39.66665649414063 0 L 39.66665649414063 39.66665649414063 L 0 39.66665649414063 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lubbn0 =
    '<svg viewBox="3.3 5.0 33.1 28.1" ><path transform="translate(1.31, 1.96)" d="M 15.22221851348877 31.09721374511719 L 15.22221851348877 21.18054962158203 L 21.83332633972168 21.18054962158203 L 21.83332633972168 31.09721374511719 L 30.09721374511719 31.09721374511719 L 30.09721374511719 17.87499618530273 L 35.05554580688477 17.87499618530273 L 18.52777290344238 3 L 1.99999988079071 17.87499618530273 L 6.95833158493042 17.87499618530273 L 6.95833158493042 31.09721374511719 L 15.22221851348877 31.09721374511719 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2oyv8c =
    '<svg viewBox="7.5 7.5 30.0 30.0" ><path transform="translate(3.5, 3.5)" d="M 19 4 L 16.35625076293945 6.643749237060547 L 26.81875038146973 17.125 L 4 17.125 L 4 20.875 L 26.81875038146973 20.875 L 16.35625076293945 31.35625076293945 L 19 34 L 34 19 L 19 4 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l505wp =
    '<svg viewBox="0.0 0.0 30.5 30.5" ><path  d="M 0 0 L 30.5 0 L 30.5 30.5 L 0 30.5 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mmlnuf =
    '<svg viewBox="2.5 2.5 25.4 24.1" ><path transform="translate(0.54, 0.54)" d="M 24.87500190734863 7.083333492279053 L 19.79166793823242 7.083333492279053 L 19.79166793823242 4.541666984558105 C 19.79166793823242 3.131041526794434 18.66062545776367 2 17.25000190734863 2 L 12.16666698455811 2 C 10.75604248046875 2 9.625 3.131041526794434 9.625 4.541666984558105 L 9.625 7.083333492279053 L 4.541666984558105 7.083333492279053 C 3.131041526794434 7.083333492279053 2.012708425521851 8.214374542236328 2.012708425521851 9.625 L 2 23.60416793823242 C 2 25.01479339599609 3.131041526794434 26.14583396911621 4.541666984558105 26.14583396911621 L 24.87500190734863 26.14583396911621 C 26.2856273651123 26.14583396911621 27.41666793823242 25.01479339599609 27.41666793823242 23.60416793823242 L 27.41666793823242 9.625 C 27.41666793823242 8.214374542236328 26.2856273651123 7.083333492279053 24.87500190734863 7.083333492279053 Z M 17.25000190734863 7.083333492279053 L 12.16666698455811 7.083333492279053 L 12.16666698455811 4.541666984558105 L 17.25000190734863 4.541666984558105 L 17.25000190734863 7.083333492279053 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n9zhef =
    '<svg viewBox="0.0 0.0 33.5 33.5" ><path  d="M 0 0 L 33.5 0 L 33.5 33.5 L 0 33.5 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1d3x21 =
    '<svg viewBox="1.4 4.2 30.7 25.1" ><path transform="translate(0.4, 1.19)" d="M 6.583333969116211 17.2095832824707 L 6.583333969116211 22.79291725158691 L 16.35416603088379 28.125 L 26.125 22.79291725158691 L 26.125 17.2095832824707 L 16.35416603088379 22.54166793823242 L 6.583333969116211 17.2095832824707 Z M 16.35416603088379 3 L 1 11.375 L 16.35416603088379 19.75 L 28.91666603088379 12.89645957946777 L 28.91666603088379 22.54166793823242 L 31.70833587646484 22.54166793823242 L 31.70833587646484 11.375 L 16.35416603088379 3 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yf5gdb =
    '<svg viewBox="0.0 0.0 31.5 32.0" ><path  d="M 0 0 L 31.49999809265137 0 L 31.49999809265137 32 L 0 32 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p101d6 =
    '<svg viewBox="4.4 1.5 22.6 26.1" ><path transform="translate(1.44, 0.48)" d="M 20.59722137451172 15.34583377838135 L 14.3125 15.34583377838135 L 14.3125 21.86666488647461 L 20.59722137451172 21.86666488647461 L 20.59722137451172 15.34583377838135 Z M 19.34027671813965 1 L 19.34027671813965 3.608333110809326 L 9.284722328186035 3.608333110809326 L 9.284722328186035 1 L 6.770833015441895 1 L 6.770833015441895 3.608333110809326 L 5.513888359069824 3.608333110809326 C 4.118680000305176 3.608333110809326 3.012569427490234 4.782083988189697 3.012569427490234 6.216666698455811 L 3 24.47499847412109 C 3 25.90958213806152 4.118680000305176 27.08333396911621 5.513888359069824 27.08333396911621 L 23.11111068725586 27.08333396911621 C 24.49374961853027 27.08333396911621 25.625 25.90958213806152 25.625 24.47499847412109 L 25.625 6.216666698455811 C 25.625 4.782083988189697 24.49374961853027 3.608333110809326 23.11111068725586 3.608333110809326 L 21.85416603088379 3.608333110809326 L 21.85416603088379 1 L 19.34027671813965 1 Z M 23.11111068725586 24.47499847412109 L 5.513888359069824 24.47499847412109 L 5.513888359069824 10.12916660308838 L 23.11111068725586 10.12916660308838 L 23.11111068725586 24.47499847412109 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1n72gt =
    '<svg viewBox="335.0 181.0 21.0 21.0" ><path transform="translate(335.0, 181.0)" d="M 4.375298976898193 21.00270080566406 L 4.373642444610596 21.00104522705078 L 4.373980522155762 21.00070571899414 L 3.869628812935844e-07 21.00270080566406 L 3.869628812935844e-07 16.6274356842041 L 12.90329837799072 3.724238634109497 L 17.27859687805176 8.099503517150879 L 4.375298976898193 21.00270080566406 Z M 18.52598190307617 6.851066112518311 L 18.52515411376953 6.850249290466309 L 14.1517333984375 2.475812911987305 L 16.2863597869873 0.341204822063446 C 16.50623893737793 0.1213274374604225 16.79825019836426 0.0002298022736795247 17.10862731933594 0.0002298022736795247 C 17.41899108886719 0.0002298022736795247 17.71129608154297 0.1213274374604225 17.93168830871582 0.341204822063446 L 20.66165733337402 3.071151256561279 C 21.1147632598877 3.524240732192993 21.1147632598877 4.262330055236816 20.66165733337402 4.716469764709473 L 18.52680969238281 6.850249290466309 L 18.52598190307617 6.851066112518311 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
