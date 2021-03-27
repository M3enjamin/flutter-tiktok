import 'package:flutter/material.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class UserPageHeader extends StatelessWidget {
  final String userName;
  const UserPageHeader(this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.arrow_back, size: 20))),
          Row(
            children: [
              Text(
                userName,
                style: TextStyle(
                    color: black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          Container(
            width: 50,
            height: 50,
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
