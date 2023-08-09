// import 'package:crud/widgets/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:crud/routes/mapping.dart';
// import 'package:crud/widgets/drawer.dart';
// import 'package:crud/widgets/domainCard.dart';
//
// class Landing_Page extends StatefulWidget {
//   const Landing_Page({super.key});
//
//   @override
//   State<Landing_Page> createState() => _Landing_PageState();
// }
// class _Landing_PageState extends State<Landing_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:MyAppBar(domain: "App Name"),
//       body: Padding(
//         padding: EdgeInsets.all(0.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Domain(imageURL:"images/aiml.png" ,name:"AI and ML",renderpage: MyRoutes.AI_MLRoute,),
//               Domain(name:"Web Development",imageURL: "images/web.png",renderpage: MyRoutes.Web_DevRoute,),
//               Domain(name:"Android (Flutter)",imageURL: "images/flutter.png",renderpage: MyRoutes.FlutterRoute,),
//               Domain(name:"Android (Kotlin)",imageURL: "images/kotlin.png",renderpage: MyRoutes.KotlinRoute,),
//               Domain(name:"DSA and Programming",imageURL: "images/dsa.png",renderpage: MyRoutes.DSARoute,),
//               Domain(name:"Designing",imageURL: "images/designing.png",renderpage: MyRoutes.DesigningRoute,),
//               Domain(name:"Management",imageURL: "images/management.png",renderpage: MyRoutes.ManagementRoute,),
//               SizedBox(height: 40)
//             ],
//           ),
//         ),
//       ),
//       drawer:MyDrawer(),
//     );
//   }
// }
import "package:crud/routes/mapping.dart";
import "package:crud/widgets/drawer.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../widgets/domainCard.dart";

class Landing_Page extends StatefulWidget {
  const Landing_Page({super.key});

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}

class _Landing_PageState extends State<Landing_Page> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
                backgroundColor: Colors.transparent,
              title: Text("Clubopedia", style: GoogleFonts.ptSansCaption(fontSize: 28, fontWeight: FontWeight.bold)),
              leading:Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.menu_rounded),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                      );
                   },
              )
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Domain(
                              name: "AI & ML",
                              tagline: "Unleashing the language of automation",
                              people_count: "10",
                              colour: 0xffFF9B3D,
                              opcolor:0x66FF9B3D,
                              renderpage: MyRoutes.AI_MLRoute),
                          Domain(
                              name: "Web Development ",
                              tagline: "Crafting digital experiences with code",
                              people_count: "21",
                              colour:0xff8BDAA1,
                              opcolor: 0x668BDAA1,
                              renderpage: MyRoutes.Web_DevRoute),
                          Domain(
                              name: "App Development",
                              tagline: "Innovating experiences through mobile apps",
                              people_count: "10",
                              colour:0xffA8E9E3,
                              opcolor:0x66A8E9E3,
                              renderpage: MyRoutes.AppDevRoute),
                          Domain(
                              name: "DSA & CP",
                              tagline: "Code to conquer challenges",
                              people_count: "10",
                              colour:0xffEDCAAA,
                              opcolor:0x66EDCAAA,
                              renderpage: MyRoutes.DSARoute),

                          Domain(
                              name: "UI / UX",
                              tagline: "Elevating design, enhancing user journeys",
                              people_count: "4",
                              colour:0xffFBFF37,
                              opcolor:0x66FBFF37,
                              renderpage: MyRoutes.DesigningRoute),
                          Domain(
                              name: "Management",
                              tagline: "Guiding success, forging a strong future",
                              people_count: "14",
                              colour:0xffD4B9FE,
                              opcolor:0x66D4B9FE,
                              renderpage: MyRoutes.ManagementRoute)
                          ,Container(height:20)
                        ],
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}