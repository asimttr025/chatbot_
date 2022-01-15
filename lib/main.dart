import 'package:chatbot/Login_screen/login_screen.dart';
import 'package:chatbot/models/chat_model.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:chatbot_project/LoginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyCjxNDmwGBfIUCbCBu4IGmMK3y6Q6zpcqg", appId: "1:887176028396:web:326d5482b9702bee9a05c9", messagingSenderId: "887176028396", projectId: "rasa-cb2f3"),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatBot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: LoginScreen(),
    );
  }
}
