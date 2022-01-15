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
      color: bgColor,
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
        child: Row(children: [
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
                      "Welcome to Bis Çözüm Interview",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
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
                          "Email Adress",
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "you@example.com",
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
                                primary: secondaryColor),
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
                              " LOGIN ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ))),
                    SizedBox(
                      height: 5.0,
                    ),
                    orDivider("OR"),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                primary: secondaryColor),
                            onPressed: () {},
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: [
                                  TextSpan(
                                      text: "LOGIN WITH ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  TextSpan(
                                      text: "Google",
                                      style: TextStyle(
                                          color: Colors.deepOrange.shade500,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))
                                ])))),
                  ],
                ),
              ),
            ),
          ),
          if (Responsive.isDesktop(context))
            Expanded(
                flex: 2,
                child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: ImageSliderClass()))

          /* Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(
                  "assets/images/login_bg3.png",
                  height: 700,
                  width: 200,
                ),
              ),
            )*/
        ]),
      ),
    );
  }
}

Widget orDivider(String title) {
  return Container(
    child: Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            width: double.infinity,
            child: Divider(
              color: Colors.grey.shade200,
              height: 36,
            )),
      ),
      Text(title),
      Expanded(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.grey.shade200,
              height: 36,
            )),
      ),
    ]),
  );
}

Widget getMyCardView(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return CardView(horizontal: 100, vertical: 25);
  } else {
    return CardView(horizontal: 15, vertical: 15);
  }
}

class ImageSliderClass extends StatefulWidget {
  const ImageSliderClass({Key? key}) : super(key: key);

  @override
  _ImageSliderClassState createState() => _ImageSliderClassState();
}

class _ImageSliderClassState extends State<ImageSliderClass> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: [
          CarouselSlider(
            items: [
              Image.asset(
                "assets/images/login_bg3.png",
              ),
              Image.asset(
                "assets/images/interview2_rounded.png",
              ),
              Image.asset(
                "assets/images/chatbot_img_rounded.png",
              ),
            ],

            //Slider Container properties

            options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,

                //viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                }),
          ),
          Center(
              child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 3,
            effect: SlideEffect(dotColor: Colors.white),
          )),
        ],
      ),
    );
  }
}
