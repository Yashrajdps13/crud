import 'package:crud/routes/mapping.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        width: 0.7*(MediaQuery.of(context).size.width),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
          height: MediaQuery.of(context).size.height,
          width: 0.5*(MediaQuery.of(context).size.width),
        child:Padding(
          padding: const EdgeInsets.only(left:30),
          child: ListView(
            children:[
              SizedBox(height: 50),
              ListTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image(
                        image: AssetImage('images/gp19.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(height:27),
              ListTile(
                title:Text('Home',style: GoogleFonts.ptSansCaption(color:Color(0xffE1E1E1),fontSize: 28,fontWeight: FontWeight.bold,)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height:34),
              ListTile(
                title:Text('About Us',style: GoogleFonts.ptSansCaption(color:Color(0xffE1E1E1),fontSize: 28,fontWeight: FontWeight.bold,)),
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.AboutRoute);
                },
              ),
            ]
          ),
        )
      )
    );
  }
}