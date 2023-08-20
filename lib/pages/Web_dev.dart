import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/profile_card.dart';
class Web_developers extends StatefulWidget {
  const Web_developers({super.key});

  @override
  State<Web_developers> createState() => _Web_developersState();
}

class _Web_developersState extends State<Web_developers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        width: double.infinity,
        child: SingleChildScrollView(
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
                            Text("Web Development",style:TextStyle(color: Color(0xff6DF1A5),fontSize: 25,fontWeight: FontWeight.bold),),
                            Container(height:15),
                            Text("Knowledge of HTML, CSS, JavaScript, frameworks, databases, backend languages, and responsive design is crucial."
                              ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50,left: 16,right:16),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Hackslash_Web').snapshots(),
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
                                domain: 'Web Development',
                                bgc:0xFF004703,
                                gc1:0xff017633,
                                gc2:0xff00FF6C,
                                out:0xff6DF1A5,
                                outo:0x666DF1A5,
                              team: "Team 405 Found",
                                back_photo: "images/profile_images/web.png",
                                link_photo: "images/profile_images/web_in.png"
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
    );
  }
}