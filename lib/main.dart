import 'package:englishstudy/responsive/mobile_screen_layout.dart';
import 'package:englishstudy/responsive/responsive_layout_screen.dart';
import 'package:englishstudy/responsive/web_screen_layout.dart';
import 'package:englishstudy/screens/login_screen.dart';
import 'package:englishstudy/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDXdZhpYMC0lcRSFwNjR_hHUKPDYSEur7A",
        appId: "1:9048376289:android:ae5fa74f8d9b23f98f48a0",
        messagingSenderId: "9048376289",
        projectId: "englishstudyapp-31934",
        storageBucket: "englishstudyapp-31934.appspot.com",
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English Study',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          )
        )
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: LoginScreen(),


    );
  }
}


