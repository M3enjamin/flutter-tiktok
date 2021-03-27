import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tiktok/themes/colors.dart';
import 'package:flutter_tiktok/widgets/me_page_header.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
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
                child: DecoratedBox(
                  child: MePageHeader(),
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/2624752?v=4'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          '@m3enjamin',
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
                                            color: black.withOpacity(.3)))),
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
                                            color: black.withOpacity(.3)))),
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
                                            new BorderRadius.circular(2.0))),
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
                                      borderRadius:
                                          new BorderRadius.circular(2.0))),
                            ),
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: SizedBox(
                                height: 40,
                                child: DecoratedBox(
                                  child: TabBar(
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicatorColor: black,
                                      labelColor: black,
                                      unselectedLabelColor:
                                          black.withOpacity(0.4),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            width: 40,
                                            child: Icon(
                                              Icons.menu,
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            width: 40,
                                            child: Icon(
                                              Icons.favorite_border,
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            width: 40,
                                            child: Icon(
                                              Icons.lock_outline,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.5,
                                        color: black.withOpacity(.2),
                                      ),
                                      top: BorderSide(
                                        width: 0.5,
                                        color: black.withOpacity(.2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              //Add this to give height
                              height: MediaQuery.of(context).size.height,
                              child: TabBarView(children: [
                                Container(),
                                Container(),
                                Container(),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
