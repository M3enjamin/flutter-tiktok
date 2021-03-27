import 'package:flutter/material.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class LiveIcon extends StatefulWidget {
  @override
  _LiveIconState createState() => _LiveIconState();
}

class _LiveIconState extends State<LiveIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 6.0).animate(_animationController);
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return Center(
                  child: Container(
                    width: 44.0 + _animation.value,
                    height: 44.0 + _animation.value,
                    decoration: new BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1 - _animationController.value,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }),
          Center(
            child: Container(
              width: 44.0,
              height: 44.0,
              decoration: new BoxDecoration(
                color: white,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.red),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/2624752?v=4'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
