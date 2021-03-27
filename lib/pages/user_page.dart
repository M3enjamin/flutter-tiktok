import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tiktok/database/videos.dart';
import 'package:flutter_tiktok/themes/colors.dart';
import 'package:flutter_tiktok/widgets/user_page_header.dart';

class UserPage extends StatefulWidget {
  final String userKey;
  final String userName;
  final String userImg;

  UserPage(this.userKey, this.userName, this.userImg);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(color: white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
                height: 50,
                child: DecoratedBox(
                  child: UserPageHeader(widget.userName),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: black.withOpacity(.3),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(widget.userImg),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          '@' + widget.userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 105,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).following,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 0, right: 0),
                              width: 1,
                              height: 15,
                              child: DecoratedBox(
                                child: Container(),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 0.5,
                                      color: black.withOpacity(.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 105,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).follower,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 0, right: 0),
                              width: 1,
                              height: 15,
                              child: DecoratedBox(
                                child: Container(),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 0.5,
                                      color: black.withOpacity(.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 105,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).like,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: ButtonTheme(
                                minWidth: 160.0,
                                height: 40,
                                child: OutlineButton(
                                  child: new Text(
                                    "Edit profile",
                                    style:
                                        TextStyle(color: black, fontSize: 12),
                                  ),
                                  onPressed: null,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(2.0),
                                  ),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 20.0,
                              height: 40,
                              child: OutlineButton(
                                child: Icon(
                                  Icons.turned_in_not,
                                  color: black,
                                ),
                                onPressed: null,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(2.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        children: List.generate(
                            items
                                .where((video) =>
                                    video["userkey"] == widget.userKey)
                                .length, (index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 2.0, bottom: 2.0),
                              child: AspectRatio(
                                aspectRatio: 3 / 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/thumbnails/" +
                                                  widget.userKey +
                                                  "_" +
                                                  (index + 1).toString() +
                                                  ".png"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// bool isit(video, userKey) {
//   return ;
// }
