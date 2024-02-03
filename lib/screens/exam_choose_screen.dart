import 'package:englishstudy/screens/feed_screen.dart';
import 'package:flutter/material.dart';

class ExamChooseScreen extends StatefulWidget {
  const ExamChooseScreen({super.key});

  @override
  State<ExamChooseScreen> createState() => _MyApp1State();
}

class _MyApp1State extends State<ExamChooseScreen> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle getCustomButtonStyle() {
      return ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          fixedSize: Size(50, 36)
      );
    }
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading:
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeedSceen())),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: const Text('1/15', style: TextStyle(color: Colors.white, fontSize: 20),),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  )
              )
            ],
          ),
          body: Container(
            color: Colors.teal,
            child: Container(
                margin: const EdgeInsets.only(top:5),
                width: double.infinity,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Teddy",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                          ]
                      ),
                      const Divider(
                        color: Colors.teal,
                        thickness: 1,
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "This is your doll",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                              )
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () { },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    fixedSize: Size(150, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    )
                                ),
                                child: const Text("Đúng", style: TextStyle(color: Colors.white, fontSize: 18),)
                            ),
                            ElevatedButton(
                                onPressed: () { },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal[300],
                                    fixedSize: const Size(150, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    )
                                ),
                                child: const Text("Sai", style: TextStyle(color: Colors.white, fontSize: 18),)
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}