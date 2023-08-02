import 'package:crud/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:crud/routes/mapping.dart';
import 'package:crud/widgets/drawer.dart';
import 'package:crud/widgets/category.dart';

class Landing_Page extends StatefulWidget {
  const Landing_Page({super.key});

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}
class _Landing_PageState extends State<Landing_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Domain(imageURL:"images/aiml.png" ,name:"AI and ML",renderpage: MyRoutes.AI_MLRoute,),
              Domain(name:"Web Development",imageURL: "images/web.png",renderpage: MyRoutes.Web_DevRoute,),
              Domain(name:"Android (Flutter)",imageURL: "images/flutter.png",renderpage: MyRoutes.FlutterRoute,),
              Domain(name:"Android (Kotlin)",imageURL: "images/kotlin.png",renderpage: MyRoutes.KotlinRoute,),
              Domain(name:"DSA and Programming",imageURL: "images/dsa.png",renderpage: MyRoutes.DSARoute,),
              Domain(name:"Designing",imageURL: "images/designing.png",renderpage: MyRoutes.DesigningRoute,),
              Domain(name:"Management",imageURL: "images/management.png",renderpage: MyRoutes.ManagementRoute,),
            ],
          ),
        ),
      ),
      drawer:MyDrawer(),
    );
  }
}