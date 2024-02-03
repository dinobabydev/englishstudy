// view.dart
import 'package:flutter/material.dart';

class YourScreen extends StatefulWidget {
  final List<String> imagePaths;
  const YourScreen({super.key, required this.imagePaths});

  @override
  State<YourScreen> createState() => _MyHomePageViewState();
}

class _MyHomePageViewState extends State<YourScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const double itemHeight = 130;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF02ADA4),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: widget.imagePaths.map((String imagePath) {
            return Container(
              child: Center(
                child: Image(
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
