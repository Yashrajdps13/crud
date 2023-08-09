import 'package:crud/routes/mapping.dart';
import 'package:flutter/material.dart';

import '../routes/mapping.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          alignment: Alignment.center,
          child:
          GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, MyRoutes.ProfileRoute),
              },child:Container(
              color:Colors.amberAccent,
              height:40,width: 200,
              child:Text("click",style:TextStyle(color: Colors.black87))
          )),
        )
    );
  }
}