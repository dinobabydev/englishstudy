import 'package:flutter/material.dart';

import 'feed_screen.dart';

class ListenAndRepeatScreen extends StatefulWidget {
  const ListenAndRepeatScreen({super.key});

  @override
  State<ListenAndRepeatScreen> createState() => _ListenAndRepeatState();
}

class _ListenAndRepeatState extends State<ListenAndRepeatScreen> {
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
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Text("Lắng nghe và gõ lại thuật ngữ", textAlign: TextAlign.center ,style: TextStyle(color: Colors.blueGrey, fontSize: 30)),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Center(
                        child: Icon(Icons.volume_up)
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      )
                  ),
                  suffixIcon: Icon(Icons.info, color: Colors.teal,),
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
