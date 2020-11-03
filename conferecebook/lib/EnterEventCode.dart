import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './WelcomeonBoard.dart';
import 'package:adobe_xd/page_link.dart';
import './HomeFeed.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterEventCode extends StatelessWidget {
  EnterEventCode({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 412.0,
            height: 870.0,
            decoration: BoxDecoration(
              color: const Color(0xff1a2677),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(326.0, 402.0),
            child:
                // Adobe XD layer: 'arrow_forward-24px' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => WelcomeonBoard(),
                ),
              ],
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 35.0, 35.0),
                      size: Size(35.0, 35.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_755e5l,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(5.8, 5.8, 23.3, 23.3),
                      size: Size(35.0, 35.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_sub2yt,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(60.0, 149.5),
            child: Text(
              'Here for a new event?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 58,
                color: const Color(0xffffffff),
                letterSpacing: 0.54375,
                height: 1.0344827586206897,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(135.0, 829.0),
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
        ],
      ),
    );
  }
}

const String _svg_755e5l =
    '<svg viewBox="0.0 0.0 35.0 35.0" ><path  d="M 0 0 L 35 0 L 35 35 L 0 35 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sub2yt =
    '<svg viewBox="5.8 5.8 23.3 23.3" ><path transform="translate(1.83, 1.83)" d="M 15.66666698455811 4 L 13.61041831970215 6.056249618530273 L 21.74791717529297 14.20833396911621 L 4 14.20833396911621 L 4 17.125 L 21.74791717529297 17.125 L 13.61041831970215 25.27708435058594 L 15.66666698455811 27.33333396911621 L 27.33333396911621 15.66666698455811 L 15.66666698455811 4 Z" fill="#1a2677" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
