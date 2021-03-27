import 'package:flutter/material.dart';
import 'package:flutter_tiktok/themes/colors.dart';
import 'package:flutter_tiktok/widgets/inbox_page_header.dart';
import 'package:flutter_tiktok/widgets/live_icon.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: 50,
              child: InboxPageHeader(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 15.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Center(
                      child: LiveIcon(),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Meilleurs LIVE",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    padding: EdgeInsets.all(6.0),
                    width: 120,
                    child: Center(
                      child: Text(
                        "Regarder",
                        style: TextStyle(
                            color: white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.red),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      TikTokIcons.messages,
                      size: 72,
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 8),
                      child: Text(
                        "Toute l'actualité",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Les notifications à propos de ton compte apparaissent ici",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
