import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

class TopicCardWidget extends StatefulWidget {
  const TopicCardWidget({super.key});

  @override
  State<TopicCardWidget> createState() => _TopicCardWidgetState();
}

class _TopicCardWidgetState extends State<TopicCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: appBarColor
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.folder_copy, color: Colors.teal,),
              Text(" 0. Guide", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 20),)
            ],
          ),
          Text("48 thuat ngu", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 15),)
        ],
      ),
    );
  }
}
