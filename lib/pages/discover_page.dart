import 'package:flutter/material.dart';
import 'package:flutter_tiktok/database/hashtags.dart';
import 'package:flutter_tiktok/themes/colors.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 10),
            height: 54,
            decoration: BoxDecoration(
                color: white,
                border: Border(
                    bottom: BorderSide(width: .5, color: Colors.black12))),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text(
                          "Rechercher",
                          style: TextStyle(color: Colors.black26),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: black.withOpacity(.05),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.qr_code_scanner_outlined),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                  ),
                  for (var key in hashtags.keys) buildHashtagItem(context, key)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildHashtagItem(context, hashtag) {
  return Container(
    color: white,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 36,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  child: Center(
                      child: Text(
                    "#",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(18)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hashtag,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Hashtag à la mode",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    hashtags[hashtag].length.toString() + " >",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(3)),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          height: 150,
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var url in hashtags[hashtag])
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                          // color: Colors.black12,
                          image: DecorationImage(
                              image: AssetImage(url), fit: BoxFit.cover)),
                    ),
                  )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          height: 0,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: .5, color: Colors.black12))),
        ),
      ],
    ),
  );
}
