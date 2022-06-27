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
    options: FirebaseOptions(
        apiKey: "AIzaSyB5lGyxcI_Qda9O1CCA5YoWovfTt58urNg",
        appId: "1:312297302755:web:a07cc942c0b7c7a5ad73d6",
        messagingSenderId: "312297302755",
        projectId: "dentistapp-ce4fc"),
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
