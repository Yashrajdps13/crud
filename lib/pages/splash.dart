import 'package:crud/pages/landingPage.dart';
import 'package:crud/routes/mapping.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // TODO: implement initState

    _navigatetohome();
  }

  void _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2300), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Landing_Page()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 0.4 * (MediaQuery.of(context).size.height)),
          Center(
            child: Row(
              children: [
                SizedBox(width: 0.04 * (MediaQuery.of(context).size.width)),
                Stack(
                  children: [
                    Image.asset("images/logo_half.png",
                        height: 150, width: 270),
                    Positioned(
                      left: 140,
                      bottom: 53,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText('HYVE',
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontFamily: 'Candara'),
                              speed: const Duration(milliseconds: 250)),
                        ],
                      ),
                    )
                  ],
                ),
                Spacer()
              ],
            ),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "images/bottom_half.png",
                height: 300,
              )),
        ],
      ),
    );
  }
}
