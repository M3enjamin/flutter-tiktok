import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_tiktok/pages/discover_page.dart';
import 'package:flutter_tiktok/pages/home_page.dart';
import 'package:flutter_tiktok/pages/inbox_page.dart';
import 'package:flutter_tiktok/pages/me_page.dart';
import 'package:flutter_tiktok/themes/colors.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';
import 'package:flutter_tiktok/widgets/upload_icon.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  var _selectedPageIndex;
  List<Widget> _pages;
  PageController _pageController;

  final GlobalKey<HomePageState> _homePageState = GlobalKey<HomePageState>();

  // int _currentIndex = 0;
  // final List<Widget> _children = [
  //   HomePage(),
  //   DiscoverPage(),
  //   Center(
  //     child: Text(
  //       "Upload",
  //       style:
  //           TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.bold),
  //     ),
  //   ),
  //   InboxPage(),
  //   MePage(),
  // ];
  Color bgColor = black;
  Color iconsColor = white;

  @override
  void initState() {
    super.initState();
    FlutterStatusbarcolor.setStatusBarColor(bgColor);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(iconsColor == white);

    _selectedPageIndex = 0;
    _pages = [
      HomePage(key: _homePageState),
      DiscoverPage(),
      Center(
        child: Text(
          "Upload",
          style: TextStyle(
              color: black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      InboxPage(),
      MePage(),
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {
        "icon": TikTokIcons.home,
        "label": AppLocalizations.of(context).home,
        "isIcon": true,
        "iconsColor": white,
        "bgColor": black,
      },
      {
        "icon": TikTokIcons.search,
        "label": AppLocalizations.of(context).discover,
        "isIcon": true,
        "iconsColor": black,
        "bgColor": white,
      },
      {
        "icon": "",
        "label": "",
        "isIcon": false,
        "iconsColor": black,
        "bgColor": white,
      },
      {
        "icon": TikTokIcons.messages,
        "label": AppLocalizations.of(context).inbox,
        "isIcon": true,
        "iconsColor": black,
        "bgColor": white,
      },
      {
        "icon": TikTokIcons.profile,
        "label": AppLocalizations.of(context).me,
        "isIcon": true,
        "iconsColor": black,
        "bgColor": white,
      }
    ];
    return Container(
      height: 60,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: black.withOpacity(.2),
            ),
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return bottomItems[index]['isIcon']
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _selectedPageIndex = index;
                          _pageController.jumpToPage(index);
                          index == 0
                              ? _homePageState.currentState.playVideo()
                              : _homePageState.currentState.pauseVideo();
                          iconsColor = bottomItems[index]['iconsColor'];
                          bgColor = bottomItems[index]['bgColor'];
                          FlutterStatusbarcolor.setStatusBarColor(bgColor);
                          FlutterStatusbarcolor.setStatusBarWhiteForeground(
                              iconsColor == white);
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              bottomItems[index]['icon'],
                              color: iconsColor,
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                bottomItems[index]['label'],
                                style:
                                    TextStyle(color: iconsColor, fontSize: 8),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          _selectedPageIndex = index;
                          _pageController.jumpToPage(index);
                          iconsColor = bottomItems[index]['iconsColor'];
                          bgColor = bottomItems[index]['bgColor'];
                          FlutterStatusbarcolor.setStatusBarColor(bgColor);
                          FlutterStatusbarcolor.setStatusBarWhiteForeground(
                              iconsColor == white);
                        });
                      },
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child:
                              Center(child: UploadIcon(bgColor, iconsColor))));
            }),
          ),
        ),
      ),
    );
  }
}
