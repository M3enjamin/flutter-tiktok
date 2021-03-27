import 'package:flutter/material.dart';
import 'package:flutter_tiktok/themes/colors.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';

class MePageHeader extends StatelessWidget {
  const MePageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(TikTokIcons.profile, size: 20),
          Row(
            children: [
              Text(
                "M3enjamin",
                style: TextStyle(
                    color: black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 24,
          ),
        ],
      ),
    );
  }
}
