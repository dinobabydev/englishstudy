import 'package:englishstudy/models/studycard.dart';
import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';



class SkillTaskWidget extends StatefulWidget {
  final StudyCard skillTaskModel;
  const SkillTaskWidget({super.key, required this.skillTaskModel});

  @override
  State<SkillTaskWidget> createState() => _SkillTaskWidgetState();
}

class _SkillTaskWidgetState extends State<SkillTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        height: 70,
        decoration: BoxDecoration(
          color: appBarColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                child: CircleAvatar(foregroundImage: NetworkImage(widget.skillTaskModel.imageUrl),)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.skillTaskModel.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textBodyColorThemeDark),),
                Text(widget.skillTaskModel.description, style: const TextStyle(fontSize: 12,color: textBodyColorThemeDark),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
