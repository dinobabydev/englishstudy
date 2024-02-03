import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

import 'feed_screen.dart';
class ExamEnterValueScreen extends StatefulWidget {
  const ExamEnterValueScreen({super.key});

  @override
  State<ExamEnterValueScreen> createState() => _MyApp1State();
}

class _MyApp1State extends State<ExamEnterValueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(''),
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
        color: Colors.black,

        child: const Column(
          children: [
            Text("Nhập thuật ngữ tương ứng với nghĩa sau", textAlign: TextAlign.center ,style: TextStyle(color: Colors.blueGrey, fontSize: 30)),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  "Đó là túi của tôi, nhưng ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  )),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: appBarColor,
                      width: 2
                    )
                  )
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: const Size(150, 36),
        ),
        onPressed: () { },
        child: const Text(
          "Trả lời",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

