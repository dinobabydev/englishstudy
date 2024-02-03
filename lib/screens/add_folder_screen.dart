import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

class AddFolderScreen extends StatefulWidget {
  const AddFolderScreen({super.key});

  @override
  State<AddFolderScreen> createState() => _BottomSheetAppState();
}

class _BottomSheetAppState extends State<AddFolderScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset("assets/logos/Logo.png", width: 60),
            backgroundColor: Colors.teal,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(minHeight: 80.0),
                child: const Material(
                  color: Color(0xff008080),
                  child: TabBar(
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.bookmarks_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.folder_copy_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    BottomSheetExample(),
                    BottomSheetExample(),
                  ],
                ),
              ),
              // Container at the bottom of the screen
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.teal,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.folder_copy,
                              color: Colors.white),
                          onPressed: () => _showCreateFolderDialog(context),
                        ),
                        const Text(
                          " Tạo học phần",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.folder, color: Colors.white),
                          onPressed: () => _showCreateFolderDialog(context),
                        ),
                        const Text(
                          " Tạo thư mục",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),

                      ],
                    ),
                    const SizedBox(height:30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(5),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.teal),
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.folder, color: Colors.teal),
                onPressed: () {},
              ),
              const Text(
                "Family and Friends",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<void> _showCreateFolderDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const CreateFolderDialog();
    },
  );
}

class CreateFolderDialog extends StatelessWidget {
  const CreateFolderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Container(
        width: double.infinity,

        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close, color: appBarColor,)
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      // Do something with folderName and description
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.save, color: appBarColor,)),
                Text("Lưu"),
              ],
            )
          ],
        ),
      ),
      content: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextFormField(
              decoration:  InputDecoration(

                  suffixIcon: IconButton(
                    onPressed: (){},
                      icon: Icon(Icons.folder, color: appBarColor,)
                  ),
                hintText: "Tên thư mục",
                hintStyle: TextStyle(color: appBarColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                )
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration:  InputDecoration(

                  suffixIcon: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.mic, color: appBarColor,)
                  ),
                  hintText: "Mô tả không bắt buộc",
                  hintStyle: TextStyle(color: appBarColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
