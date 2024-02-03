import 'dart:typed_data';

import 'package:englishstudy/resources/auth_methods.dart';
import 'package:englishstudy/screens/login_screen.dart';
import 'package:englishstudy/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  selectImage() async{
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }
  
  void signUpUser() async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods()
        .signupUser(
        email: _emailController.text, 
        password: _passwordController.text, 
        username: _usernameController.text,
        file: _image!
    );
    setState(() {
      _isLoading = false;
    });
    if(res != "success"){
      showSankBar(res, context);
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1,child: Container(),),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logos/Logo.png", color: appBarColor,width: 100,),
                  const Text("English Study", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: appBarColor),),
                ],
              ),
              const SizedBox(height: 10,),
              Stack(
                children: [
                  _image != null
                  ?
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                  :
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG23nGg2_a8b1c-DejPxyjL65FsmBcfjabMg&usqp=CAU"),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo
                        ),
                      )
                  )
                ],
              ),
              const SizedBox(height: 24,),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email address",
                  textInputType: TextInputType.emailAddress
              ),
              const SizedBox(height: 24,),
              TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: "Enter your username",
                  textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24,),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24,),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      color: buttonActive
                  ),
                  child: _isLoading
                              ?
                          const Center(child: CircularProgressIndicator(color: Colors.white,),)
                              :
                          const Text("SignIn", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                ),
              ),
              Flexible(child: Container(), flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Have an account"),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen())),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(" Login", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
