import 'package:flutter/material.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class InboxPageHeader extends StatelessWidget {
  const InboxPageHeader({
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
          Container(
            width: 20,
          ),
          Row(
            children: [
              Text(
                "Toute l'activité",
                style: TextStyle(
                    color: black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          Icon(
            Icons.send_outlined,
            color: Colors.black,
            size: 24,
          ),
        ],
      ),
    );
  }
}
