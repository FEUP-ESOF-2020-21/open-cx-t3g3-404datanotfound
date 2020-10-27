import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Chat.dart';
import 'package:adobe_xd/page_link.dart';
import './HomeFeed.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyMessages extends StatelessWidget {
  MyMessages({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(34.0, 216.0),
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
            offset: Offset(34.0, 554.0),
            child: Container(
              width: 345.0,
              height: 307.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(63.0, 665.0),
            child: Container(
              width: 287.0,
              height: 190.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, -26.0),
            child: Container(
              width: 345.0,
              height: 232.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0x54ececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 387.0),
            child: Container(
              width: 345.0,
              height: 127.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(27.5, 53.5),
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
          Container(),
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(328.0, 226.0),
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
            offset: Offset(328.0, 564.0),
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
            offset: Offset(328.0, 398.0),
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
            offset: Offset(79.0, 39.0),
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
            offset: Offset(191.9, 237.0),
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
            offset: Offset(211.1, 410.0),
            child: SizedBox(
              width: 104.0,
              child: Text(
                'John  Lucas',
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
            offset: Offset(195.5, 575.0),
            child: SizedBox(
              width: 120.0,
              child: Text(
                'Cedric Moody',
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
            offset: Offset(34.0, 387.0),
            child: Container(
              width: 345.0,
              height: 127.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: const Color(0xffececec),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(328.0, 398.0),
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
            offset: Offset(211.1, 410.0),
            child: SizedBox(
              width: 104.0,
              child: Text(
                'John  Lucas',
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
            offset: Offset(275.0, 347.0),
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
            offset: Offset(310.5, 347.0),
            child: SizedBox(
              width: 23.0,
              child: Text(
                '57',
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
            offset: Offset(255.5, 348.0),
            child: SizedBox(
              width: 15.0,
              child: Text(
                '0',
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
            offset: Offset(275.0, 478.0),
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
            offset: Offset(310.5, 478.0),
            child: SizedBox(
              width: 23.0,
              child: Text(
                '17',
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
            offset: Offset(255.5, 478.0),
            child: SizedBox(
              width: 15.0,
              child: Text(
                '0',
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
            offset: Offset(59.5, 269.5),
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
            offset: Offset(59.5, 435.5),
            child: Text(
              'Dr. Franz Hernandez has just delivered a great talk!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff666666),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(52.7, 413.0),
            child: SizedBox(
              width: 41.0,
              child: Text(
                '17h23',
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
            offset: Offset(52.7, 240.0),
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
            offset: Offset(63.5, 612.5),
            child: Text(
              'I just thought of this to respond to Prof.\nAlberts challenge. What about it?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xff666666),
                letterSpacing: 0.140625,
                fontWeight: FontWeight.w300,
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(52.7, 578.0),
            child: SizedBox(
              width: 41.0,
              child: Text(
                '16h59',
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
          SvgPicture.string(
            _svg_45dyeu,
            allowDrawingOutsideViewBox: true,
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
            offset: Offset(287.0, 0.0),
            child: Container(
              width: 126.0,
              height: 870.0,
              decoration: BoxDecoration(
                color: const Color(0x99ffffff),
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(74.0, 25.0),
            child: SvgPicture.string(
              _svg_6r27s1,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(315.0, 24.0),
            child: SizedBox(
              width: 76.0,
              height: 76.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 76.0, 76.0),
                    size: Size(76.0, 76.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
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
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(108.5, 47.5),
            child: Text(
              'My Messages',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: const Color(0xff6200ee),
                letterSpacing: 0.1875,
                fontWeight: FontWeight.w700,
                height: 1.15,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(229.0, 157.0),
            child:
                // Adobe XD layer: 'arrow_forward-24px' (group)
                SizedBox(
              width: 30.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                    size: Size(30.0, 30.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_hj3tpl,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                    size: Size(30.0, 30.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_dgc95z,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(229.0, 234.0),
            child:
                // Adobe XD layer: 'arrow_forward-24px' (group)
                SizedBox(
              width: 30.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                    size: Size(30.0, 30.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_hj3tpl,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                    size: Size(30.0, 30.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SvgPicture.string(
                      _svg_dgc95z,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 146.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Chat(),
                ),
              ],
              child: SizedBox(
                width: 245.0,
                height: 108.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 108.0),
                      size: Size(245.0, 108.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27.0),
                          color: const Color(0xfff9f9f9),
                        ),
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                      size: Size(245.0, 108.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      fixedHeight: true,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                            size: Size(245.0, 49.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                                  size: Size(245.0, 49.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: const Color(0xffececec),
                                    ),
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(7.0, 3.0, 42.0, 42.0),
                                  size: Size(245.0, 49.0),
                                  pinLeft: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                      image: DecorationImage(
                                        image: const AssetImage(''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(59.5, 13.0, 100.0, 21.0),
                            size: Size(245.0, 49.0),
                            fixedWidth: true,
                            fixedHeight: true,
                            child: Text(
                              'Cedric Moody',
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
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(207.0, 10.0, 30.0, 30.0),
                            size: Size(245.0, 49.0),
                            pinRight: true,
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'arrow_forward-24px' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                                  size: Size(30.0, 30.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child: SvgPicture.string(
                                    _svg_hj3tpl,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                                  size: Size(30.0, 30.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child: SvgPicture.string(
                                    _svg_dgc95z,
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
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(201.5, 79.7, 34.0, 16.0),
                      size: Size(245.0, 108.0),
                      pinRight: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: Text(
                        '12h33',
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
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(12.5, 51.8, 191.0, 21.0),
                      size: Size(245.0, 108.0),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: Text(
                        'You: That seems amazing!',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xff666666),
                          letterSpacing: 0.15,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(12.5, 79.7, 157.0, 16.0),
                      size: Size(245.0, 108.0),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: Text(
                        'Organizer @ IT Summit 2021',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: const Color(0xff6200ee),
                          letterSpacing: 0.11249999999999999,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 268.0),
            child: SizedBox(
              width: 245.0,
              height: 106.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 106.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xfff9f9f9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                          size: Size(245.0, 49.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color(0xffececec),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(7.0, 3.0, 42.0, 42.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(57.5, 13.0, 90.0, 21.0),
                          size: Size(245.0, 49.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Mary Sophie',
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
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(207.0, 10.0, 30.0, 30.0),
                          size: Size(245.0, 49.0),
                          pinRight: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'arrow_forward-24px' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_hj3tpl,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_dgc95z,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(201.5, 79.7, 34.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '12h10',
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 51.8, 221.0, 21.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Text(
                      'Mary: What about the model...',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff666666),
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 79.7, 153.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Attendee @ IT Summit 2021',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0xff6200ee),
                        letterSpacing: 0.11249999999999999,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 388.0),
            child: SizedBox(
              width: 245.0,
              height: 106.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 106.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xfff9f9f9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                          size: Size(245.0, 49.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color(0xffececec),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(6.0, 4.0, 42.0, 42.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(56.5, 13.0, 103.0, 21.0),
                          size: Size(245.0, 49.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Alicia Sanders',
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
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(207.0, 10.0, 30.0, 30.0),
                          size: Size(245.0, 49.0),
                          pinRight: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'arrow_forward-24px' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_hj3tpl,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_dgc95z,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(200.5, 79.7, 35.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '26 Oct',
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 51.8, 208.0, 21.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Text(
                      'You: I agree. It should be in...',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff666666),
                        letterSpacing: 0.15,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 79.7, 158.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Sponsor @ TED Sydney 2019',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0xff6200ee),
                        letterSpacing: 0.11249999999999999,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 509.0),
            child: SizedBox(
              width: 245.0,
              height: 106.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 106.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xfff9f9f9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                          size: Size(245.0, 49.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color(0xffececec),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(7.0, 3.0, 42.0, 42.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(57.5, 13.0, 77.0, 21.0),
                          size: Size(245.0, 49.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Joe Trump',
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
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(207.0, 10.0, 30.0, 30.0),
                          size: Size(245.0, 49.0),
                          pinRight: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'arrow_forward-24px' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_hj3tpl,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_dgc95z,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(200.5, 79.7, 35.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '26 Oct',
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 51.8, 219.0, 21.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Text(
                      'Joe: Hey! What do you think...',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff666666),
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 79.7, 159.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Attendee @TED Sydney 2019',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0xff6200ee),
                        letterSpacing: 0.11249999999999999,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 626.0),
            child: SizedBox(
              width: 245.0,
              height: 106.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 106.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xfff9f9f9),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                          size: Size(245.0, 49.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 245.0, 49.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: const Color(0xffececec),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(7.0, 3.0, 42.0, 42.0),
                                size: Size(245.0, 49.0),
                                pinLeft: true,
                                pinTop: true,
                                pinBottom: true,
                                fixedWidth: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(57.5, 14.0, 82.0, 21.0),
                          size: Size(245.0, 49.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Elisabeth Q',
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
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(207.0, 10.0, 30.0, 30.0),
                          size: Size(245.0, 49.0),
                          pinRight: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'arrow_forward-24px' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 30.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_hj3tpl,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(5.0, 5.0, 20.0, 20.0),
                                size: Size(30.0, 30.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: SvgPicture.string(
                                  _svg_dgc95z,
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(204.5, 79.7, 31.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      '5 Ago',
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
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 51.8, 209.0, 21.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: Text(
                      'Elisabeth: Definitely a good...',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff666666),
                        letterSpacing: 0.15,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(12.5, 79.7, 168.0, 16.0),
                    size: Size(245.0, 106.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'Speaker @ Symbio Wired 2020',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: const Color(0xff6200ee),
                        letterSpacing: 0.11249999999999999,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(28.6, 823.6),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => HomeFeed(),
                ),
              ],
              child: SvgPicture.string(
                _svg_mimlrp,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
const String _svg_45dyeu =
    '<svg viewBox="0.0 0.0 287.0 870.0" ><path  d="M 0 0 L 287 0 L 287 870 L 0 870 L 0 0 Z" fill="#6200ee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6r27s1 =
    '<svg viewBox="74.0 25.0 316.0 75.0" ><path transform="translate(74.0, 25.0)" d="M 37.5 0 L 278.5 0 C 299.210693359375 0 316 16.78931999206543 316 37.5 C 316 58.21067810058594 299.210693359375 75 278.5 75 L 37.5 75 C 16.78931999206543 75 0 58.21067810058594 0 37.5 C 0 16.78931999206543 16.78931999206543 0 37.5 0 Z" fill="#ececec" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hj3tpl =
    '<svg viewBox="0.0 0.0 30.0 30.0" ><path  d="M 0 0 L 30 0 L 30 30 L 0 30 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dgc95z =
    '<svg viewBox="5.0 5.0 20.0 20.0" ><path transform="translate(1.0, 1.0)" d="M 14 4 L 12.23750019073486 5.762499809265137 L 19.21250152587891 12.75 L 4 12.75 L 4 15.25 L 19.21250152587891 15.25 L 12.23750019073486 22.23750114440918 L 14 24.00000190734863 L 24.00000190734863 14 L 14 4 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mimlrp =
    '<svg viewBox="28.6 823.6 25.6 25.6" ><path transform="translate(26.56, 821.56)" d="M 25.02500915527344 2 L 4.558334350585938 2 C 3.151250600814819 2 2.012791633605957 3.151250600814819 2.012791633605957 4.558334350585938 L 2 27.58334350585938 L 7.116668701171875 22.4666748046875 L 25.02500915527344 22.4666748046875 C 26.43209266662598 22.4666748046875 27.58334350585938 21.3154239654541 27.58334350585938 19.90834045410156 L 27.58334350585938 4.558334350585938 C 27.58334350585938 3.151250600814819 26.43209266662598 2 25.02500915527344 2 Z M 22.4666748046875 17.35000610351563 L 7.116668701171875 17.35000610351563 L 7.116668701171875 14.79167175292969 L 22.4666748046875 14.79167175292969 L 22.4666748046875 17.35000610351563 Z M 22.4666748046875 13.51250457763672 L 7.116668701171875 13.51250457763672 L 7.116668701171875 10.95417022705078 L 22.4666748046875 10.95417022705078 L 22.4666748046875 13.51250457763672 Z M 22.4666748046875 9.675003051757813 L 7.116668701171875 9.675003051757813 L 7.116668701171875 7.116668701171875 L 22.4666748046875 7.116668701171875 L 22.4666748046875 9.675003051757813 Z" fill="#f9f9f9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
