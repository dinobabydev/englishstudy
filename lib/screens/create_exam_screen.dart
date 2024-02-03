import 'package:englishstudy/utils/colors.dart';
import 'package:flutter/material.dart';

class CreateExamScreen extends StatefulWidget {
  const CreateExamScreen({super.key});

  @override
  State<CreateExamScreen> createState() => _CreateExamScreenState();
}

class _CreateExamScreenState extends State<CreateExamScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.black,
          ),

          floatingActionButton: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width*0.7, 50)
            ),
            child: const Text(
              "Bắt đầu làm bài kiểm tra",
              style: TextStyle(
                  color: appBarColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Thiết lập bài kiểm tra",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.note, color: appBarColor, size: 40,))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Số câu hỏi",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),),
                      OutlinedButton(
                          onPressed: (){},

                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: appBarColor
                            ),
                            shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(10),

                            ),
                            minimumSize: const Size(70, 50),
                          ),
                          child: Text("10", style: TextStyle(fontWeight: FontWeight.w400, color: appBarColor, fontSize: 20),)
                      )
                    ],

                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                  color: appBarColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text("Đúng/Sai", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                    Switch(
                        value:true,
                        onChanged: (bool isCheck){},
                        activeColor: appBarColor,
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text("Nhiều lựa chọn", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                    Switch(
                      value:true,
                      onChanged: (bool isCheck){},
                      activeColor: appBarColor,
                    )

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
