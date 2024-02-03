import 'package:englishstudy/models/yourimage.dart';
import 'package:englishstudy/screens/create_exam_screen.dart';
import 'package:englishstudy/screens/exam_choose_screen.dart';
import 'package:englishstudy/screens/exam_entervalue_screen.dart';
import 'package:englishstudy/screens/folder_screen.dart';
import 'package:englishstudy/screens/game_screen.dart';
import 'package:englishstudy/screens/grammar_screen.dart';
import 'package:englishstudy/screens/listen_and_repeat_screen.dart';
import 'package:englishstudy/screens/task_grammar_screen.dart';
import 'package:englishstudy/screens/your_screen.dart';
import 'package:englishstudy/utils/colors.dart';
import 'package:englishstudy/utils/global_variable.dart';
import 'package:flutter/material.dart';
import '../widgets/card_study_widget.dart';

class FeedSceen extends StatefulWidget {
  const FeedSceen({super.key});

  @override
  State<FeedSceen> createState() => _FeedSceenState();
}

class _FeedSceenState extends State<FeedSceen> {
  final TextEditingController _searchController = TextEditingController();
  List listSkillCards = listCards;

  List<dynamic> listCardRenders(String query){
    if(query.isEmpty){
      return listCards;
    }
    List newListCards = listCards.where((card) => card.title.toLowerCase().contains(query.toLowerCase())).toList();
    return newListCards;
  }

  @override
  void dispose() {

    super.dispose();
    _searchController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Image.asset("assets/logos/Logo.png", width: 60,),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.share, color: textBodyColorThemeDark,)
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: appBarColor,
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/logos/Logo.png", width: 80,),
                      const Text(
                        "English Study",
                        style: TextStyle(
                            color: textBodyColorThemeDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)
                        ,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TaskGrammarScreen())),
                    child: const Text("Grammar", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GrammarScreen())),
                    child: const Text("2.2.Grammar", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExamChooseScreen())),
                    child: const Text("ExamChooseScreen", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExamEnterValueScreen())),
                    child: const Text("ExamEnterValueScreen", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListenAndRepeatScreen())),
                    child: const Text("ListAndRepeat", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  YourScreen(imagePaths: YourImage().imagePaths))),
                    child: const Text("Your", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const GameScreen())),
                    child: const Text("Game", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const CreateExamScreen())),
                    child: const Text("Create", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child:  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Thư mục", style: TextStyle(color: appBarColor, fontSize: 20, fontWeight: FontWeight.bold),),
                            IconButton(
                                padding: const EdgeInsets.only(right: 0),
                                onPressed: (){},
                                icon: const Icon(Icons.filter_list, color: appBarColor,)
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FolderScreen())),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 15, left: 10),
                            width: MediaQuery.of(context).size.width*0.7,
                            height: 165,
                            decoration: const BoxDecoration(
                                color: backgroundCard,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            padding: const EdgeInsets.all(20),
                            child:  Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(folders.title,
                                  style: const TextStyle(
                                    color: textBodyColorThemeDark,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.folder, color: Colors.white,size: 30,),
                                    const SizedBox(width: 10,),
                                    Text(folders.listTerms.length.toString() + " bộ thẻ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: textBodyColorThemeDark),)
                                  ],
                                )
                              ],
                            ),
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
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                hintText: "Bộ lọc",
                                hintStyle: const TextStyle(color: appBarColor, fontSize: 16, fontWeight: FontWeight.bold),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appBarColor, width: 2),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appBarColor, width: 2),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        listSkillCards = listCardRenders(_searchController.text);
                                      });
                                    },
                                    icon: const Icon(Icons.search, color: Colors.teal, size: 25),
                                ),

                            ),
                          
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: listSkillCards.isNotEmpty ?  Column(
                              children:listSkillCards.map((card) =>  Container(margin: const EdgeInsets.only(top: 5, bottom: 5), child: CardStudyWidget(cardStudyModel: card,))).toList()
                            //CardStudyScreen(title: "2.5.Skills", description: "23 thuật ngữ", creatDate: DateTime(2023, 1, 1), cardImage: "https://i.pinimg.com/1200x/64/30/1c/64301c42f058143fbc4a313e05aa0bbe.jpg",),
                          ) :
                          const Center(
                            child: Text("Không tìm thấy thẻ học", style: TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        )


                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
