import 'package:englishstudy/resources/auth_methods.dart';
import 'package:englishstudy/screens/signup_screen.dart';
import 'package:englishstudy/utils/colors.dart';
import 'package:englishstudy/widgets/text_field_input.dart';
import 'package:englishstudy/widgets/text_field_input_password.dart';
import 'package:flutter/material.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isHidePassword = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  void loginUser() async{
    setState(() {
      _isLoading =true;

    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    if(res == "success"){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
      const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      )
      ));
    }else{
      showSankBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void nagivationToSignIn() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logos/Logo.png", color: appBarColor,width: 100,),
                  const Text("English Study", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: appBarColor),),
                ],
              ),
              const SizedBox(height: 54,),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email address",
                  textInputType: TextInputType.emailAddress
              ),
              const SizedBox(height: 24,),
              // TextFieldInput(
              //     textEditingController: _passwordController,
              //     hintText: "Enter your password",
              //     textInputType: TextInputType.text,
              //     isPass: true
              // ),
              TextFieldInputPassword(
                  textEditingController: _passwordController,
                  hintText: "Enter your password",
                  textInputType: TextInputType.text,
                  isPass: _isHidePassword,
                  iconData: _isHidePassword ? Icons.remove_red_eye : Icons.visibility_off,
                  method: (){setState(() {
                    _isHidePassword = !_isHidePassword;
                  });},
              ),
              const SizedBox(height: 24,),
              InkWell(
                onTap: loginUser,
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
                  child: _isLoading ?
                          const Center(child: CircularProgressIndicator(color: Colors.white,),)
                              :
                          Text("Login", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),

                ),
              ),
              Flexible(child:  Container(), flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don's have an account"),
                  ),
                  GestureDetector(
                    onTap: nagivationToSignIn,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(" Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
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
