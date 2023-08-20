import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/profile_card.dart';

class KotlinPage extends StatefulWidget {
  const KotlinPage({super.key});

  @override
  State<KotlinPage> createState() => _KotlinPageState();
}

class _KotlinPageState extends State<KotlinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom:10),
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
                        padding: const EdgeInsets.only(left:30.0,right:30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Image(
                                  image: AssetImage('images/gp19.png'),
                                ),
                              ),
                            ),
                            Container(height:27),
                            Text("Kotlin",style:TextStyle(color: Color(0xff69E5E0),fontSize: 25,fontWeight: FontWeight.bold),),
                            Container(height:15),
                            Text("Proficiency in Kotlin, including OOP, Android architecture, UI/UX design, libraries, and API integration, is essential for development"
                              ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50,left:16,right:16),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Hackslash_Kotlin').snapshots(),
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
                                domain: 'Kotlin',
                                bgc:0xFF004703,
                                gc1:0xff037777,
                                gc2:0xff69E5E0,
                                out:0xff69E5E0,
                                outo:0x6669E5E0,
                              team: "Team Nougat(Kotlin)",
                                back_photo: "images/profile_images/kotlin.png",
                                link_photo: "images/profile_images/kotlin_in.png"
                            )
                        );
                      },
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}