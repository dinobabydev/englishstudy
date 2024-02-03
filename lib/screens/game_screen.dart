import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

import 'feed_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _Grid_LayoutState();
}

class _Grid_LayoutState extends State<GameScreen> {
  List<String> widgetList = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H','I', 'J', 'K', 'L'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width/1.5 ;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading:
        IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeedSceen())),
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text('795 ms', style: TextStyle(color: Colors.white, fontSize: 25),),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              )
          )
        ],
      ),
      body:  Container(
        color: Colors.black,
        child:  GridView.count(
          crossAxisCount: 3,
          childAspectRatio: (itemWidth / itemHeight),
          controller:  ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: widgetList.map((String value) {
            return  Container(
              color: appBarColor,
              margin:  EdgeInsets.all(1.0),
              child:  Center(
                child:  Text(
                  value,
                  style:  TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}