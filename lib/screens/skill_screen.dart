
import 'package:englishstudy/models/skillcard.dart';
import 'package:englishstudy/models/studycard.dart';
import 'package:englishstudy/utils/colors.dart';
import 'package:englishstudy/widgets/slider_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/skill_task_widget.dart';




class SkillScreen extends StatefulWidget {
  final SkillCard card_study_model;
  const SkillScreen({Key? key, required this.card_study_model}) : super(key: key);

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.card_study_model.title,
            style:const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: appBarColor,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white, size: 25),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: Colors.white, // Set background color to white
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  height: MediaQuery.of(context).size.height * 0.31,
                  child: SliderWidget(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            width: 60,
                            height: 60,
                            child: CircleAvatar(
                              foregroundImage: NetworkImage(widget.card_study_model.imageUrl),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: 50,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.card_study_model.title, style: const TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w600),),
                                Text(widget.card_study_model.description, style: const TextStyle(color: Colors.teal))
                              ],
                            ),
                          ),

                        ],
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.cloud_download_sharp, color: Colors.teal,)
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  child:  Column(
                      children: (widget.card_study_model.skillTasks.isNotEmpty)
                                  ?
                                  widget.card_study_model.skillTasks.map((task) => Container(margin: const EdgeInsets.symmetric(vertical: 5), child: SkillTaskWidget(skillTaskModel: task),)).toList()
                                    :
                                  [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: const Text("No tasks available", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),),
                                    )
                                  ]
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text("Thẻ học", style: TextStyle(color: appBarColor, fontSize: 20, fontWeight: FontWeight.bold),),
                    IconButton(
                        padding: const EdgeInsets.only(right: 0),
                        onPressed: (){},
                        icon: const Icon(Icons.filter_list, color: appBarColor,)
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("doll", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                              Text("BUP BE", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.home, color: Colors.white,)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.white,))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: addButtonColor,
            onPressed: () {

            },
            child: const ClipOval(
                child: Icon(Icons.add, color: Colors.white,)
            )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
