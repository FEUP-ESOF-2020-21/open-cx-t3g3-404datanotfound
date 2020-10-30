import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './WelcomeonBoard.dart';
import 'package:adobe_xd/page_link.dart';
import './HomeFeed.dart';
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

class EnterEventCode extends StatelessWidget {
  EnterEventCode({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 412.0,
            height: 870.0,
            decoration: BoxDecoration(
              color: const Color(0xff680aee),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(326.0, 390.0),
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
                        _svg_y7lqys,
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
        ],
      ),
    );
  }
}

const String _svg_755e5l =
    '<svg viewBox="0.0 0.0 35.0 35.0" ><path  d="M 0 0 L 35 0 L 35 35 L 0 35 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y7lqys =
    '<svg viewBox="5.8 5.8 23.3 23.3" ><path transform="translate(1.83, 1.83)" d="M 15.66666698455811 4 L 13.61041831970215 6.056249618530273 L 21.74791717529297 14.20833396911621 L 4 14.20833396911621 L 4 17.125 L 21.74791717529297 17.125 L 13.61041831970215 25.27708435058594 L 15.66666698455811 27.33333396911621 L 27.33333396911621 15.66666698455811 L 15.66666698455811 4 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
