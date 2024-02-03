import 'package:englishstudy/models/skillcard.dart';
import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

import '../screens/skill_screen.dart';


class CardStudyWidget extends StatefulWidget {
  final SkillCard cardStudyModel;
  const CardStudyWidget({super.key, required this.cardStudyModel});

  @override
  State<CardStudyWidget> createState() => _CartStudyScreenState();
}

class _CartStudyScreenState extends State<CardStudyWidget> {
  String getRelativeTime() {
    final currentDate = DateTime.now();
    final difference = currentDate.difference(widget.cardStudyModel.startDate);

    if (difference.inDays >= 30) {
      final months = difference.inDays ~/ 30;
      return '$months tháng trước';
    } else {
      return '${difference.inDays} ngày trước';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillScreen(card_study_model: widget.cardStudyModel)));
      },

      child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width*0.6,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.cardStudyModel.imageUrl), // Replace with your image URL
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child:  Column(

              children:
              [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.width*0.3,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(widget.cardStudyModel.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: textBodyColorThemeDark),),
                          Text(widget.cardStudyModel.description, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: textBodyColorThemeDark),),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.access_alarm_outlined, color: Colors.white,),
                          Text(getRelativeTime(),  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: textBodyColorThemeDark),),
                        ],
                      )
                    ],
                  ),
                ),
              ]
          )
      ),
    );
  }
}
