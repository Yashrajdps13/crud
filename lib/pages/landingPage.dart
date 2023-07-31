import 'package:flutter/material.dart';
import 'package:crud/routes/mapping.dart';
import 'package:crud/widgets/drawer.dart';

class Landing_Page extends StatefulWidget {
  const Landing_Page({super.key});

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}

class _Landing_PageState extends State<Landing_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Row(children: [
          Padding(padding: EdgeInsets.fromLTRB(99, 0, 0, 0)),
          Text(
            'App name',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(width: 10),
          Image.asset(
            "images/Batman_Logo.png",
            fit: BoxFit.contain,
            height: 40,
          ),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.AI_MLRoute);
                },
                child: Stack(children: [
                  Container(
                    child: Image(
                      image: AssetImage("images/aiml.png"),
                    ),
                  ),
                  Container(
                    height: 158,
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "AI and ML",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.Web_DevRoute);
                },
                child: Stack(children: [
                  Container(
                    child: Image(
                      image: AssetImage("images/web.png"),
                    ),
                  ),
                  Container(
                    height: 158,
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Web Development",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.Android_DevRoute);
                },
                child: Stack(children: [
                  Container(
                    child: Image(
                      image: AssetImage("images/app.png"),
                    ),
                  ),
                  Container(
                    height: 158,
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Android Development",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.DSARoute);
                },
                child: Stack(children: [
                  Container(
                    child: Image(
                      image: AssetImage("images/dsa.png"),
                    ),
                  ),
                  Container(
                    height: 158,
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "DSA and Programming",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.DesigningRoute);
                },
                child: Stack(children: [
                  Container(
                    child: Image(
                      image: AssetImage("images/designing.png"),
                    ),
                  ),
                  Container(
                    height: 158,
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Designing",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
      drawer:Drawer(),
    );
  }
}
