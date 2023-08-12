import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/widgets/About_Us_Card.dart';
import 'package:crud/widgets/appbar.dart';
import 'package:crud/widgets/drawer.dart';
import 'package:crud/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import "package:crud/widgets/profile_card.dart";

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  String? Utkarsh_Photo;
  Widget build(BuildContext context) {
    DocumentReference Utkarsh=FirebaseFirestore.instance.collection("Hackslash_flutter").doc("6");
    Utkarsh.get().then((snap){
      Utkarsh_Photo=snap['photoURL'];
    });
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)) ,
                    gradient: LinearGradient(
                      begin:Alignment.topCenter,end:Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 0, 0, 0),Color.fromARGB(63, 114, 114, 114),
                      ],
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(left:30.0,right:30.0, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height:130),
                        Text("About Us",style:TextStyle(color: Color(0xff9ca700),fontSize: 25,fontWeight: FontWeight.bold),),
                        Container(height:15),
                        Text("We are the developers of this Application. This is an effort from our side to connect our college student to people with skills through LinkedIn. We made this as a project at the end of our First Year."
                          ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AboutUsCard(name: "Utkarsh Ranjan", photo: Utkarsh_Photo!, department: "CSE", gc1: 0xffffd84d, gc2: 0xff9c7a00, outo: 0x66ffd84d,),
                    Container(height:20)
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}