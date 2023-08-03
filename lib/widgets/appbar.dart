import "package:flutter/material.dart";

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final domain;
  const MyAppBar({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1394E8),
      elevation: 0.0,
      title: Row(children: [
        //Padding(padding: EdgeInsets.fromLTRB(99, 0, 0, 0)),
        Spacer(),
        Text(
          domain,
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite,55);
}