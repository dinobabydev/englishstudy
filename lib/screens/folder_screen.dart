import 'package:englishstudy/screens/add_folder_screen.dart';
import 'package:englishstudy/utils/colors.dart';
import 'package:englishstudy/widgets/topic_card_widget.dart';
import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Family and Friends", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
            centerTitle: true,
            backgroundColor: appBarColor,

            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.more_vert)
              )
            ],

          ),

          floatingActionButton: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FloatingActionButton(
              onPressed: ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddFolderScreen())),
              backgroundColor: addButtonColor,
              child: const Icon(Icons.add, color: Colors.white,),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.teal
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    TopicCardWidget(),
                    SizedBox(height: 24,),
                    TopicCardWidget(),
                    SizedBox(height: 24,),
                    TopicCardWidget(),
                    SizedBox(height: 24,),
                    TopicCardWidget(),
                    SizedBox(height: 24,),
                    TopicCardWidget(),
                    SizedBox(height: 24,),
                  ],
                ),
              ),
            ),
          ),

        )
    );
  }
}
