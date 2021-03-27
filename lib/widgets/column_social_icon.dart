import 'package:flutter/material.dart';
import 'package:flutter_tiktok/pages/user_page.dart';
import 'package:flutter_tiktok/themes/colors.dart';

Widget getAlbum(albumImg, profileImg) {
  return RotatingImage(albumImg: albumImg, profileImg: profileImg);
}

Widget getIcons(icon, count, size) {
  return Container(
    child: Column(
      children: <Widget>[
        Icon(icon, color: white, size: size),
        SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: TextStyle(
              color: white, fontSize: 12, fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}

Widget getProfile(context, userKey, userName, userImg) {
  return InkWell(
    onTap: () =>
        Navigator.of(context).push(_createRoute(userKey, userName, userImg)),
    child: Container(
      width: 50,
      height: 60,
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: white),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(userImg), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 3,
            left: 15,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: white,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class RotatingImage extends StatefulWidget {
  final albumImg;
  final profileImg;
  RotatingImage({this.albumImg, this.profileImg});

  @override
  _RotatingImageState createState() => new _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 4),
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: Container(
        width: 50,
        height: 50,
        child: Stack(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(shape: BoxShape.circle, color: white),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  black.withOpacity(0.7),
                  Colors.black,
                  black.withOpacity(0.7)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Center(
              child: Container(
                width: widget.albumImg != "null" ? 50 : 30,
                height: widget.albumImg != "null" ? 50 : 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(widget.albumImg), fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      ),
      builder: (BuildContext context, Widget _widget) {
        return new Transform.rotate(
          angle: animationController.value * 6.3,
          child: _widget,
        );
      },
    );
  }
}

Route _createRoute(userKey, userName, userImg) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        UserPage(userKey, userName, userImg),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
