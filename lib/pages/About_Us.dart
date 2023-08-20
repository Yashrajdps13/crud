import 'package:cloud_firestore/cloud_firestore.dart';
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
  Widget build(BuildContext context) {
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
                  height:250,
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
                    padding: const EdgeInsets.only(right:30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left:24),
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
                        Container(height:27),
                        Padding(
                          padding: const EdgeInsets.only(left:32),
                          child: Text("About Us",style:TextStyle(color: Color(0xffE7C13A),fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                        Container(height:15),
                        Padding(
                          padding: const EdgeInsets.only(left:32),
                          child: Text("We are the developers of this Application. This is an effort from our side to connect our college student to people with skills through LinkedIn. We made this as a project at the end of our First Year."
                            ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50,left: 16,right:16),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('About_us').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index)=> ProfileCard(
                            snap: snapshot.data?.docs[index].data(),
                            domain: 'AboutUs',
                            bgc:0xFF471A00,gc1:0xffFFD84D,gc2:0xfff9F7D02,
                            out:0xffE7C13A,
                            outo:0x66E7C13A,
                            team: "Developing Team",
                            back_photo: "images/profile_images/aboutus.png",
                            link_photo: "images/profile_images/aboutus_in.png"
                        )
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}