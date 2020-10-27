import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './HomeFeed.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  Search({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(38.0, 707.0),
            child: SizedBox(
              width: 345.0,
              height: 127.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 345.0, 127.0),
                    size: Size(345.0, 127.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: const Color(0x80ececec),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 345.0, 127.0),
                    size: Size(345.0, 127.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: const Color(0x80ececec),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(294.0, 11.0, 43.0, 43.0),
                    size: Size(345.0, 127.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstIn),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(194.5, 23.0, 87.0, 21.0),
                    size: Size(345.0, 127.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'John  Lucas',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0x80666666),
                        letterSpacing: 0.15,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(294.0, 11.0, 43.0, 43.0),
                    size: Size(345.0, 127.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstIn),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(194.5, 23.0, 87.0, 21.0),
                    size: Size(345.0, 127.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'John  Lucas',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0x80666666),
                        letterSpacing: 0.15,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(76.0, 23.0, 24.0, 24.0),
                    size: Size(345.0, 127.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'mode_comment-24px' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                          size: Size(24.0, 24.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: SvgPicture.string(
                            _svg_1fz2j0,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(29.5, 26.0, 34.0, 16.0),
                    size: Size(345.0, 127.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '17h23',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0x80666666),
                        letterSpacing: 0.11249999999999999,
                        fontWeight: FontWeight.w300,
                        height: 2,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(63.5, 770.5),
            child: Text(
              'Dr. Franz Hernandez has just delivered a great talk!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0x80666666),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(34.0, -31.0),
            child: Container(
              width: 345.0,
              height: 179.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0x80ececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(27.5, 49.5),
            child: SizedBox(
              width: 25.0,
              height: 16.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 25.0, 1.0),
                    size: Size(25.0, 16.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_xapkg0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 8.0, 25.0, 1.0),
                    size: Size(25.0, 16.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_k4jlvk,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 16.0, 25.0, 1.0),
                    size: Size(25.0, 16.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_2ioq80,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(79.0, 35.0),
            child:
                // Adobe XD layer: 'person_search-24px' (group)
                SizedBox(
              width: 40.0,
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                    size: Size(40.0, 40.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                          size: Size(40.0, 40.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(3.3, 7.0, 33.3, 29.7),
                    size: Size(40.0, 40.0),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 33.3, 29.7),
                          size: Size(33.3, 29.7),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(6.7, 0.0, 13.0, 13.0),
                                size: Size(33.3, 29.7),
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    color: const Color(0xff6200ee),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 16.3, 15.9, 10.0),
                                size: Size(33.3, 29.7),
                                pinLeft: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_ymt87y,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(16.7, 13.0, 16.7, 16.7),
                                size: Size(33.3, 29.7),
                                pinRight: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_dgizqb,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(134.0, 825.0),
            child: SizedBox(
              width: 144.0,
              child: Text(
                'ConferenceBook',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.15,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(79.0, 348.0),
            child: Container(
              width: 300.0,
              height: 49.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(331.0, 351.0),
            child: Container(
              width: 43.0,
              height: 43.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(100.5, 362.5),
            child: Text(
              'Definitely, a great idea!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff686868),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(33.7, 367.0),
            child: SizedBox(
              width: 41.0,
              child: Text(
                '17h27',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: const Color(0xff666666),
                  letterSpacing: 0.11249999999999999,
                  fontWeight: FontWeight.w300,
                  height: 2,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(81.0, 405.0),
            child: Container(
              width: 298.0,
              height: 93.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(333.0, 408.0),
            child: Container(
              width: 43.0,
              height: 43.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(97.5, 417.5),
            child: Text(
              'Actually, I think some problems\nregarding implementation and testing can be risen!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff686868),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(33.7, 443.0),
            child: SizedBox(
              width: 41.0,
              child: Text(
                '17h29',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: const Color(0xff666666),
                  letterSpacing: 0.11249999999999999,
                  fontWeight: FontWeight.w300,
                  height: 2,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(81.0, 504.0),
            child: Container(
              width: 298.0,
              height: 186.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(334.0, 507.0),
            child: Container(
              width: 43.0,
              height: 43.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(97.5, 518.5),
            child: Text(
              'Well, did you know that F1 is the\n highest class of international \nsingle-seater auto racing sanctioned\nby the Fédération Internationale de \nl\'Automobile and owned by Liberty \nMedia? AI might be actually reality \nany time soon! PM me for more!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff686868),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(33.7, 589.0),
            child: SizedBox(
              width: 41.0,
              child: Text(
                '17h40',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: const Color(0xff666666),
                  letterSpacing: 0.11249999999999999,
                  fontWeight: FontWeight.w300,
                  height: 2,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(315.0, 20.0),
            child: Container(
              width: 76.0,
              height: 76.0,
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
            offset: Offset(315.0, 20.0),
            child: Container(
              width: 76.0,
              height: 76.0,
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
            offset: Offset(34.0, 177.0),
            child: Container(
              width: 345.0,
              height: 161.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(328.0, 187.0),
            child: Container(
              width: 43.0,
              height: 43.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(191.9, 198.0),
            child: SizedBox(
              width: 124.0,
              child: Text(
                'Isabella Smith',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xff666666),
                  letterSpacing: 0.15,
                  height: 1.5,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(275.0, 308.0),
            child:
                // Adobe XD layer: 'mode_comment-24px' (group)
                SizedBox(
              width: 24.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                    size: Size(24.0, 24.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_eterkn,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(2.0, 2.0, 20.0, 20.0),
                    size: Size(24.0, 24.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_luy4a2,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(302.5, 308.0),
            child: SizedBox(
              width: 31.0,
              child: Text(
                '123',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff666666),
                  letterSpacing: 0.13125,
                  fontWeight: FontWeight.w300,
                  height: 1.7142857142857142,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(255.5, 309.0),
            child: SizedBox(
              width: 15.0,
              child: Text(
                '3',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff666666),
                  letterSpacing: 0.13125,
                  fontWeight: FontWeight.w300,
                  height: 1.7142857142857142,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(59.5, 230.5),
            child: Text(
              'What do you think of this AI application\nfor race cars, in a context of F1, \nsuggested by Dr. Franz Hernandez?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff686868),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(52.7, 201.0),
            child: SizedBox(
              width: 41.0,
              child: Text(
                '17h25',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: const Color(0xff666666),
                  letterSpacing: 0.11249999999999999,
                  fontWeight: FontWeight.w300,
                  height: 2,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(126.0, 0.0),
            child: SvgPicture.string(
              _svg_mi9tur,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Container(
            width: 126.0,
            height: 866.0,
            decoration: BoxDecoration(
              color: const Color(0x99ffffff),
            ),
          ),
          Transform.translate(
            offset: Offset(132.8, 825.0),
            child: SizedBox(
              width: 146.0,
              child: Text(
                'ConferenceBook',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(350.0, 172.0),
            child:
                // Adobe XD layer: 'delete-24px' (group)
                SizedBox(
              width: 25.0,
              height: 25.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 25.0, 25.0),
                    size: Size(25.0, 25.0),
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
                    bounds: Rect.fromLTWH(5.2, 3.1, 14.6, 18.8),
                    size: Size(25.0, 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_pihn12,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(350.0, 288.0),
            child:
                // Adobe XD layer: 'delete-24px' (group)
                SizedBox(
              width: 25.0,
              height: 25.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 25.0, 25.0),
                    size: Size(25.0, 25.0),
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
                    bounds: Rect.fromLTWH(5.2, 3.1, 14.6, 18.8),
                    size: Size(25.0, 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_pihn12,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(350.0, 442.0),
            child:
                // Adobe XD layer: 'delete-24px' (group)
                SizedBox(
              width: 25.0,
              height: 25.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 25.0, 25.0),
                    size: Size(25.0, 25.0),
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
                    bounds: Rect.fromLTWH(5.2, 3.1, 14.6, 18.8),
                    size: Size(25.0, 25.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_pihn12,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(199.0, 44.5),
            child: SizedBox(
              width: 144.0,
              child: Text(
                'Search Panel',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: const Color(0xfff9f9f9),
                  letterSpacing: 0.1875,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
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

const String _svg_1fz2j0 =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xapkg0 =
    '<svg viewBox="18.5 34.5 25.0 1.0" ><path transform="translate(18.5, 34.5)" d="M 0 0 L 25 0" fill="none" stroke="#680aee" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k4jlvk =
    '<svg viewBox="18.5 42.5 25.0 1.0" ><path transform="translate(18.5, 42.5)" d="M 0 0 L 25 0" fill="none" stroke="#680aee" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2ioq80 =
    '<svg viewBox="18.5 50.5 25.0 1.0" ><path transform="translate(18.5, 50.5)" d="M 0 0 L 25 0" fill="none" stroke="#680aee" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ymt87y =
    '<svg viewBox="0.0 16.7 15.9 10.0" ><path transform="translate(-2.0, 2.67)" d="M 15.91666698455811 14.013427734375 C 11.36666679382324 13.84676170349121 2 16.11343002319336 2 20.66342735290527 L 2 23.99676132202148 L 17.89999961853027 23.99676132202148 C 13.78333377838135 19.39675903320313 15.85000133514404 14.18009185791016 15.91666698455811 14.013427734375 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dgizqb =
    '<svg viewBox="16.7 13.3 16.7 16.7" ><path transform="translate(4.67, 1.33)" d="M 24.38333511352539 22.0333366394043 C 24.98333549499512 21.05000114440918 25.33333396911621 19.89999961853027 25.33333396911621 18.66666793823242 C 25.33333396911621 14.98333263397217 22.34999847412109 12 18.66666793823242 12 C 14.98333549499512 12 12 14.98333263397217 12 18.66666793823242 C 12 22.34999847412109 14.98333263397217 25.33333396911621 18.66666793823242 25.33333396911621 C 19.89999961853027 25.33333396911621 21.05000114440918 24.96666717529297 22.0333366394043 24.38333511352539 L 26.31666564941406 28.66666793823242 L 28.66666793823242 26.31666564941406 L 24.38333511352539 22.0333366394043 Z M 18.66666793823242 22 C 16.83333396911621 22 15.33333396911621 20.5 15.33333396911621 18.66666793823242 C 15.33333396911621 16.83333396911621 16.83333396911621 15.33333396911621 18.66666793823242 15.33333396911621 C 20.5 15.33333396911621 22 16.83333396911621 22 18.66666793823242 C 22 20.5 20.5 22 18.66666793823242 22 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_eterkn =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_luy4a2 =
    '<svg viewBox="2.0 2.0 20.0 20.0" ><path  d="M 21.98999977111816 4 C 21.98999977111816 2.900000095367432 21.10000038146973 2 20 2 L 4 2 C 2.900000095367432 2 2 2.900000095367432 2 4 L 2 16 C 2 17.10000038146973 2.900000095367432 18 4 18 L 18 18 L 22 22 L 21.98999977111816 4 Z" fill="#656565" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mi9tur =
    '<svg viewBox="126.0 0.0 287.0 866.0" ><path transform="translate(126.0, 0.0)" d="M 0 0 L 287 0 L 287 866 L 0 866 L 0 0 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bin63t =
    '<svg viewBox="0.0 0.0 25.0 25.0" ><path  d="M 0 0 L 25 0 L 25 25 L 0 25 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pihn12 =
    '<svg viewBox="5.2 3.1 14.6 18.8" ><path transform="translate(0.21, 0.13)" d="M 6.041666984558105 19.66666793823242 C 6.041666984558105 20.8125 6.979167461395264 21.75 8.125 21.75 L 16.45833396911621 21.75 C 17.60416793823242 21.75 18.54166793823242 20.8125 18.54166793823242 19.66666793823242 L 18.54166793823242 7.166666984558105 L 6.041666984558105 7.166666984558105 L 6.041666984558105 19.66666793823242 Z M 19.58333396911621 4.041666984558105 L 15.93750190734863 4.041666984558105 L 14.89583396911621 3 L 9.6875 3 L 8.645833015441895 4.041666984558105 L 5.000000476837158 4.041666984558105 L 5.000000476837158 6.125 L 19.58333396911621 6.125 L 19.58333396911621 4.041666984558105 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
