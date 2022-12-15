import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_templates/screens/enteringScreens/login.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome-one.jpg", "welcome-two.jpg", "welcome-three.jpg"];
  List bigText = [
    "What's Happening on The World?",
    "Be Informed Instantly!",
    "Exploring the World Just Got Easier!"
  ];

  List medText = [
    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, distinctio.",
    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, distinctio.",
    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, distinctio."
  ];
  List smlText = [
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam, ex asperiores? Natus quasi architecto reprehenderit aperiam consequuntur distinctio laudantium consequatur.",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam, ex asperiores? Natus quasi architecto reprehenderit aperiam consequuntur distinctio laudantium consequatur.",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam, ex asperiores? Natus quasi architecto reprehenderit aperiam consequuntur distinctio laudantium consequatur."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff161d27).withOpacity(1),
                  Color(0xff161d27).withOpacity(0.8),
                  Color(0xff161d27).withOpacity(0.6),
                  Color(0xff161d27).withOpacity(0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            child: AppLargeText(
                              text: bigText[index],
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              child: AppText(
                                  text: medText[index],
                                  size: 26,
                                  color: Colors.white)),
                          SizedBox(height: 20),
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            child: AppText(
                              text: smlText[index],
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          SizedBox(height: 40),
                          index == 2
                              ? FlatButton(
                                  color: Color(0xff161d27).withOpacity(1),
                                  child: Text(
                                    "Next >>>",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      //Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  })
                              : Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/logo-white.png'),
                                          fit: BoxFit.contain,
                                          filterQuality: FilterQuality.high)),
                                ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexSlide) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexSlide ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexSlide
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
