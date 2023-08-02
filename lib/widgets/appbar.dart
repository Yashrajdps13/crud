import "package:flutter/material.dart";

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite,55);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff1394E8),
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
    );
  }
}