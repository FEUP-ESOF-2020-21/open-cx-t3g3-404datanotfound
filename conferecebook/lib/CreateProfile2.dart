import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './HomeFeed.dart';
import 'package:adobe_xd/page_link.dart';
import './CreateProfile1.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateProfile2 extends StatelessWidget {
  CreateProfile2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(85.0, 756.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => HomeFeed(),
                ),
              ],
              child: SizedBox(
                width: 242.0,
                height: 57.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 242.0, 57.0),
                      size: Size(242.0, 57.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 242.0, 57.0),
                            size: Size(242.0, 57.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                color: const Color(0xff680aee),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff680aee)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(30.5, 16.0, 182.0, 25.0),
                      size: Size(242.0, 57.0),
                      pinLeft: true,
                      pinRight: true,
                      fixedHeight: true,
                      child: Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 19,
                          color: const Color(0xffffffff),
                          letterSpacing: 1.6909999999999998,
                          height: 1.1578947368421053,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(18.5, 29.5),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => CreateProfile1(),
                ),
              ],
              child: SvgPicture.string(
                _svg_ieldpp,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(110.0, 41.0),
            child:
                // Adobe XD layer: 'Linear/Primary' (group)
                SizedBox(
              width: 260.0,
              height: 7.0,
              child: Stack(
                children: <Widget>[
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(281.0, 53.0),
            child: Text(
              '2/ Interests',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xff6200ee),
                letterSpacing: 0.09375,
                fontWeight: FontWeight.w300,
                height: 2.4,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(324.5, 585.0),
            child:
                // Adobe XD layer: 'Cursor' (shape)
                Container(
              width: 1.0,
              height: 17.0,
              decoration: BoxDecoration(
                color: const Color(0xff6200ee),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_ieldpp =
    '<svg viewBox="18.5 29.5 30.0 30.0" ><path transform="translate(14.5, 25.5)" d="M 34 17.125 L 11.18124961853027 17.125 L 21.66250038146973 6.643749237060547 L 19 4 L 4 19 L 19 34 L 21.64374923706055 31.35625076293945 L 11.18124961853027 20.875 L 34 20.875 L 34 17.125 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
