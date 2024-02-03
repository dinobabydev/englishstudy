import 'package:englishstudy/utils/colors.dart';
import 'package:englishstudy/widgets/grammar_task_item_widget.dart';
import 'package:englishstudy/widgets/skill_task_widget.dart';
import 'package:flutter/material.dart';

class GrammarScreen extends StatefulWidget {
  const GrammarScreen({super.key});

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('2.2.Grammar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
          backgroundColor: appBarColor,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){}, icon: Icon(Icons.search)
            ),
            IconButton(
                onPressed: (){}, icon: Icon(Icons.save)
            ),

          ],
        ),
        floatingActionButton: ElevatedButton.icon(

          style:  ElevatedButton.styleFrom(
            backgroundColor: appBarColor,
            minimumSize: const Size(100, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
            onPressed: (){},
            icon: const Icon(Icons.add, color: Colors.white,),
            label: const Text("Add", style: TextStyle(color: textBodyColorThemeDark),)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.teal,
          padding: const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 20),
          child: SingleChildScrollView(
                child: Column(
                  children: [
                    GrammarTaskItemWidget(),
                    SizedBox(height: 24,),
                    GrammarTaskItemWidget(),
                    SizedBox(height: 24,),
                    GrammarTaskItemWidget()
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
