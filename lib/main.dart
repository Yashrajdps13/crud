import 'package:crud/pages/App_Dev.dart';
import 'package:crud/pages/kotlin.dart';
import 'package:crud/pages/management.dart';
import 'package:crud/pages/profile_page.dart';
import 'package:crud/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:crud/pages/landingPage.dart';
import 'package:crud/routes/mapping.dart';
import 'package:crud/pages/AI_ML.dart';
import 'package:crud/pages/Web_dev.dart';
import 'package:crud/pages/flutter.dart';
import 'package:crud/pages/dsa.dart';
import 'package:crud/pages/designing.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:{
          "/":(context) => Landing_Page(),
          MyRoutes.landingRoute:(context)=>Landing_Page(),
          MyRoutes.AI_MLRoute:(context)=>AI_ML(),
          MyRoutes.Web_DevRoute:(context)=>Web_developers(),
          MyRoutes.FlutterRoute:(context)=>FlutterPage(),
          MyRoutes.KotlinRoute:(context)=>KotlinPage(),
          MyRoutes.DSARoute:(context)=>DSAers(),
          MyRoutes.AppDevRoute:(context)=>AppDevPage(),
          MyRoutes.DesigningRoute:(context)=>Designers(),
          MyRoutes.ManagementRoute:(context)=>ManagementPage(),
        }
    );
  }
}