import 'package:flutter/material.dart';


class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Text("WebScreen", style: TextStyle(color: Colors.black),),
        )
    );
  }
}
