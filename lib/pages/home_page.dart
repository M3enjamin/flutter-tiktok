import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/database/videos.dart';
import 'package:flutter_tiktok/themes/colors.dart';
import 'package:flutter_tiktok/widgets/column_social_icon.dart';
import 'package:flutter_tiktok/widgets/home_page_header.dart';
import 'package:flutter_tiktok/widgets/left_panel.dart';
import 'package:flutter_tiktok/widgets/lifecycle_event_handler.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  int current = 0;
  bool isOnPageTurning = false;
  PageController _controller;
  var videos = shuffle(items);
  @override
  bool get wantKeepAlive => true;
  final List<GlobalObjectKey<_VideoPlayerItemState>> videoPlayerItemKeyList =
      List.generate(
          150, (index) => GlobalObjectKey<_VideoPlayerItemState>(index));

  void scrollListener() {
    if (isOnPageTurning &&
        _controller.page == _controller.page.roundToDouble()) {
      setState(() {
        current = _controller.page.toInt();
        isOnPageTurning = false;
      });
    } else if (!isOnPageTurning && current.toDouble() != _controller.page) {
      if ((current.toDouble() - _controller.page).abs() > 0.1) {
        setState(() {
          isOnPageTurning = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = PageController();
    _controller.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return PageView.builder(
      itemCount: items.length,
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return VideoPlayerItem(
          key: videoPlayerItemKeyList[index],
          pageIndex: index,
          currentPageIndex: current,
          isPaused: isOnPageTurning,
          videoUrl: videos[index]['videoUrl'],
          size: size,
          userKey: videos[index]['userkey'],
          userName: videos[index]['name'],
          caption: videos[index]['caption'],
          songName: videos[index]['songName'],
          profileImg: videos[index]['profileImg'],
          likes: videos[index]['likes'],
          comments: videos[index]['comments'],
          shares: videos[index]['shares'],
          albumImg: videos[index]['albumImg'],
        );
      },
    );
  }

  void playVideo() {
    videoPlayerItemKeyList[current].currentState.playVideo();
  }

  void pauseVideo() {
    videoPlayerItemKeyList[current].currentState.pauseVideo();
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String userKey;
  final String userName;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final int pageIndex;
  final int currentPageIndex;
  final bool isPaused;
  VideoPlayerItem({
    Key key,
    @required this.size,
    this.userKey,
    this.userName,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
    this.videoUrl,
    this.pageIndex,
    this.currentPageIndex,
    this.isPaused,
  }) : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerController _videoController;
  bool _showPlayButton;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController.setLooping(true);
        initialized = true;
        setState(() {
          _showPlayButton = false;
        });
      });

    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
        resumeCallBack: () async => setState(() {
              _videoController.play();
              _showPlayButton = false;
            }),
        suspendingCallBack: () async => setState(() {
              _videoController.pause();
              _showPlayButton = true;
            })));
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !_showPlayButton
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: white.withOpacity(0.9),
          );
  }

  void pauseVideo() {
    _videoController.pause();
  }

  void playVideo() {
    _videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageIndex == widget.currentPageIndex &&
        (!widget.isPaused) &&
        initialized) {
      _videoController.play();
    } else {
      _videoController.pause();
    }
    return InkWell(
      onTap: () {
        setState(() {
          // if (_videoController.value.isPlaying) {
          //   _videoController.pause();
          //   _showPlayButton = true;
          // } else {
          //   _videoController.play();
          //   _showPlayButton = false;
          // }
        });
      },
      child: Container(
          height: widget.size.height,
          width: widget.size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: widget.size.height,
                width: widget.size.width,
                decoration: BoxDecoration(color: black),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _videoController.value.initialized
                          ? AspectRatio(
                              aspectRatio: _videoController.value.aspectRatio,
                              child: VideoPlayer(_videoController),
                            )
                          : VideoPlayer(_videoController),
                      Center(
                        child: Container(
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: widget.size.height,
                width: widget.size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HomePageHeader(),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          LeftPanel(
                            size: widget.size,
                            name: "${widget.userName}",
                            caption: "${widget.caption}",
                            songName: "${widget.songName}",
                          ),
                          RightPanel(
                            userKey: widget.userKey,
                            userName: widget.userName,
                            size: widget.size,
                            likes: "${widget.likes}",
                            comments: "${widget.comments}",
                            shares: "${widget.shares}",
                            profileImg: "${widget.profileImg}",
                            albumImg: "${widget.albumImg}",
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String userKey;
  final String userName;
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;
  const RightPanel({
    Key key,
    @required this.size,
    this.userKey,
    this.userName,
    this.likes,
    this.comments,
    this.shares,
    this.profileImg,
    this.albumImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                getProfile(context, userKey, userName, profileImg),
                getIcons(TikTokIcons.heart, likes, 35.0),
                getIcons(TikTokIcons.chat_bubble, comments, 35.0),
                getIcons(TikTokIcons.reply, shares, 25.0),
                getAlbum(albumImg, profileImg)
              ],
            ))
          ],
        ),
      ),
    );
  }
}

List shuffle(List videos) {
  var random = new Random();

  for (var i = videos.length - 1; i > 0; i--) {
    var n = random.nextInt(i) + 1;

    var temp = videos[i];
    videos[i] = videos[n];
    videos[n] = temp;
  }

  return videos;
}
