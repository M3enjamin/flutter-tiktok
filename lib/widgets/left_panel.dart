import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  const LeftPanel({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: TextStyle(color: white),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              SizedBox(
                  width: size.width / 2,
                  child: Container(
                    height: 30,
                    child: MarqueeWidget(
                      text: songName,
                      textStyle: TextStyle(color: white, height: 1.5),
                      scrollAxis: Axis.horizontal,
                      ratioOfBlankToScreen: 0.1,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
