import 'package:flutter/material.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class UploadIcon extends StatelessWidget {
  const UploadIcon(this.bgColor, this.iconsColor);

  final Color bgColor;
  final Color iconsColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 28,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Container(
              width: 33,
              height: 28,
              decoration: BoxDecoration(
                  color: secondary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 33,
              height: 28,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 3.5,
            child: Container(
              width: 33,
              height: 28,
              decoration: BoxDecoration(
                  color: iconsColor, borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.add,
                size: 20,
                color: bgColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
