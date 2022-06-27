import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatbot/Chat_screen/chat_screen.dart';
import 'package:chatbot/models/chat_model.dart';
import 'package:chatbot/responsive.dart';
//import 'package:chatbot_project/ChatScreen/chat_screen.dart';
//import 'package:chatbot_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        child: Center(
          child: getMyCardView(context),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final double horizontal;
  final double vertical;
  const CardView({
    Key? key,
    required this.horizontal,
    required this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chat = context.read<ChatModel>();
    return Container(
      width: double.infinity,
      height: 700,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dişler Güçler",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mail adresi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: textColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "örnek@örnek.com",
                                hintStyle: TextStyle(color: hintTextColor),
                                prefixIcon: Icon(Icons.mail)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          width: double.infinity,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: secondColor),
                              onPressed: () {
                                //Email And Password Controller
                                chat.addMailtoUser(emailController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ChatScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                " Giriş yap ",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset('images/tooth.png'),
          ],
        ),
      ),
    );
  }
}

Widget getMyCardView(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return CardView(horizontal: 100, vertical: 25);
  } else {
    return CardView(horizontal: 15, vertical: 15);
  }
}
