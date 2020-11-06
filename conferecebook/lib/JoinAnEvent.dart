import 'package:ConfereceBook/EnterEventCode.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ConfereceBook/HomeFeed.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

import 'Login.dart';

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

class JoinAnEvent extends StatelessWidget {
  JoinAnEvent({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xff1a2677),
      body: Stack(
        children: <Widget>[
          Transform.translate(offset: Offset(SizeConfig.screenWidth *  0.0, SizeConfig.screenHeight *  25.0),
              // Adobe XD layer: 'arrow_back-24px' (group)
              child: // Adobe XD layer: 'arrow_back-24px' (group)
              PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => MyLogin(),
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
                          '<svg viewBox="0.0 0.0 45.0 45.0" ><path  d="M 0 0 L 45 0 L 45 45 L 0 45 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
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
                          '<svg viewBox="7.5 7.5 30.0 30.0" ><path transform="translate(3.5, 3.5)" d="M 34 17.125 L 11.18124961853027 17.125 L 21.66250038146973 6.643749237060547 L 19 4 L 4 19 L 19 34 L 21.64374923706055 31.35625076293945 L 11.18124961853027 20.875 L 34 20.875 L 34 17.125 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 67.5, SizeConfig.screenHeight * 347.5),
            child: Text(
              'Your are an Organizer',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: const Color(0xff6ad3d2),
                letterSpacing: 0.140625,
                height: SizeConfig.screenHeight * 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 66.5, SizeConfig.screenHeight * 319.5),
            child: Text(
              'Symbio Wired 2020',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                color: const Color(0xffffffff),
                letterSpacing: 0.1875,
                fontWeight: FontWeight.w700,
                height: SizeConfig.screenHeight * 1.15,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 285.0, SizeConfig.screenHeight * 320.0),
            child:
                // Adobe XD layer: 'delete-24px' (group)
                SizedBox(
              width: SizeConfig.screenWidth * 25.0,
              height: SizeConfig.screenHeight * 25.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    size: Size(SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_g7k8u0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(SizeConfig.screenWidth * 5.2, SizeConfig.screenHeight * 3.1, SizeConfig.screenWidth * 14.6, SizeConfig.screenHeight *18.8),
                    size: Size(SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_9fxlix,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 66.5, SizeConfig.screenHeight * 395.5),
            child: Text(
              'TED Sydney 2019',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                color: const Color(0xffffffff),
                letterSpacing: 0.1875,
                fontWeight: FontWeight.w700,
                height: SizeConfig.screenHeight * 1.15,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 67.5, SizeConfig.screenHeight * 423.5),
            child: Text(
              'You are an Attendee',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: const Color(0xff6ad3d2),
                letterSpacing: 0.140625,
                height: SizeConfig.screenHeight * 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 285.0, SizeConfig.screenHeight * 395.0),
            child:
                // Adobe XD layer: 'delete-24px' (group)
                SizedBox(
              width: SizeConfig.screenWidth * 25.0,
              height: SizeConfig.screenHeight * 25.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    size: Size(SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_g7k8u0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(SizeConfig.screenWidth * 5.2, SizeConfig.screenHeight * 3.1, SizeConfig.screenWidth * 14.6, SizeConfig.screenHeight * 18.8),
                    size: Size(SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_9fxlix,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 66.5, SizeConfig.screenHeight * 471.5),
            child: Text(
              'Web Summit 2019',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                color: const Color(0xffffffff),
                letterSpacing: 0.1875,
                fontWeight: FontWeight.w700,
                height: SizeConfig.screenHeight * 1.15,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 66.5, SizeConfig.screenHeight * 499.5),
            child: Text(
              'You are an Attendee',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: const Color(0xff6ad3d2),
                letterSpacing: 0.140625,
                height:SizeConfig.screenHeight * 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 285.0, SizeConfig.screenHeight * 472.0),
            child:
                // Adobe XD layer: 'delete-24px' (group)
                SizedBox(
              width: SizeConfig.screenWidth * 25.0,
              height: SizeConfig.screenHeight * 25.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(SizeConfig.screenWidth * 0.0, SizeConfig.screenHeight * 0.0, SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    size: Size(SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_bin63t,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(SizeConfig.screenWidth * 5.2,SizeConfig.screenHeight * 3.1, SizeConfig.screenWidth * 14.6, SizeConfig.screenHeight * 18.8),
                    size: Size(SizeConfig.screenWidth * 25.0, SizeConfig.screenHeight * 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_9fxlix,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 133.0, SizeConfig.screenHeight *587.0),
            child: SizedBox(
              width: SizeConfig.screenWidth * 149.0,
              height: SizeConfig.screenHeight * 57.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                    size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight *57.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight * 57.0),
                          size: Size(SizeConfig.screenWidth * 149.0,SizeConfig.screenHeight * 57.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: SizeConfig.screenWidth * 1.0, color: const Color(0xff680aee)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(SizeConfig.screenWidth * 26.5, SizeConfig.screenHeight * 15.5, SizeConfig.screenWidth * 96.0, SizeConfig.screenHeight * 26.0),
                    size: Size(SizeConfig.screenWidth * 149.0, SizeConfig.screenHeight *57.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: PageLink(
                      links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => EnterEventCode(),
                      ),
                    ], child: Text(
                      'New Event',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17.2,
                        color: const Color(0xff1a2677),
                        letterSpacing: 0.1875,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),)
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.screenWidth * 64.5,SizeConfig.screenHeight * 145.5),
            child: Text(
              'Join one event now!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 50,
                color: const Color(0xffffffff),
                letterSpacing: 0.54375,
                height: SizeConfig.screenHeight * 1.0344827586206897,
              ),
              textAlign: TextAlign.left,
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
                  color: const Color(0xffffffff),
                  letterSpacing: 0.15,
                  height:SizeConfig.screenHeight * 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_pybriv =
    '<svg viewBox="-1.0 0.0 413.0 870.0" ><path transform="translate(-1.0, 0.0)" d="M 0 0 L 413.0000305175781 0 L 413.0000305175781 870 L 0 870 L 0 0 Z" fill="#1a2677" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g7k8u0 =
    '<svg viewBox="0.0 0.0 25.0 25.0" ><path  d="M 0 0 L 25 0 L 25 25 L 0 25 L 0 0 Z" fill="none" fill-opacity="0.7" stroke="none" stroke-width="1" stroke-opacity="0.7" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9fxlix =
    '<svg viewBox="5.2 3.1 14.6 18.8" ><path transform="translate(0.21, 0.13)" d="M 6.041666984558105 19.66666793823242 C 6.041666984558105 20.8125 6.979167461395264 21.75 8.125 21.75 L 16.45833396911621 21.75 C 17.60416793823242 21.75 18.54166793823242 20.8125 18.54166793823242 19.66666793823242 L 18.54166793823242 7.166666984558105 L 6.041666984558105 7.166666984558105 L 6.041666984558105 19.66666793823242 Z M 19.58333396911621 4.041666984558105 L 15.93750190734863 4.041666984558105 L 14.89583396911621 3 L 9.6875 3 L 8.645833015441895 4.041666984558105 L 5.000000476837158 4.041666984558105 L 5.000000476837158 6.125 L 19.58333396911621 6.125 L 19.58333396911621 4.041666984558105 Z" fill="#ffffff" fill-opacity="0.7" stroke="none" stroke-width="1" stroke-opacity="0.7" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bin63t =
    '<svg viewBox="0.0 0.0 25.0 25.0" ><path  d="M 0 0 L 25 0 L 25 25 L 0 25 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
