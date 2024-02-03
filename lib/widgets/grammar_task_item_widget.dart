import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

class GrammarTaskItemWidget extends StatefulWidget {
  const GrammarTaskItemWidget({super.key});

  @override
  State<GrammarTaskItemWidget> createState() => _GrammarTaskItemWidgetState();
}

class _GrammarTaskItemWidgetState extends State<GrammarTaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width*0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              flex: 3,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.close, color: appBarColor,)
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appBarColor,
                          width: 2
                        )
                      ),
                      focusColor: appBarColor,

                      suffixIcon: Icon(Icons.mic, color: appBarColor,),
                      hintText: "My",
                      hintStyle: TextStyle(color: appBarColor),
                      labelText: "Thuật ngữ",
                      labelStyle: TextStyle(color: appBarColor),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: appBarColor,
                                width: 2
                            )
                        )
                    ),

                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: appBarColor,
                              width: 2
                          )
                      ),
                      focusColor: appBarColor,
                      suffixIcon: Icon(Icons.mic, color: appBarColor,),
                      hintText: "My",
                      hintStyle: TextStyle(color: appBarColor),
                      labelText: "Thuật ngữ",
                      labelStyle: TextStyle(color: appBarColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appBarColor,
                          width: 2
                        )
                      )
                    ),

                  ),


                ],
              )
          ),
          Container(
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100,),
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2023/4/8/tbm-3-1680922524017298081671.jpg"),
                    radius: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.image, color: appBarColor,),
                          iconSize: 25,

                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.edit, color: appBarColor,),
                        iconSize: 25,
                      ),

                    ],
                  )


                ],
              )
          )
        ],
      ),
    );
  }
}
