import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/widgets/appbar.dart';
import 'package:crud/widgets/drawer.dart';
import 'package:crud/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import "package:crud/widgets/profile_card.dart";

class AI_ML extends StatefulWidget {
  const AI_ML({super.key});

  @override
  State<AI_ML> createState() => _AI_MLState();
}

class _AI_MLState extends State<AI_ML> {
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
                          child: Text("AI & ML",style:TextStyle(color: Color(0xffDF9568),fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                        Container(height:15),
                        Padding(
                          padding: const EdgeInsets.only(left:32),
                          child: Text("Knowledge of algorithms, data preprocessing, statistical analysis, programming, and model evaluation is essential."
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
                  stream: FirebaseFirestore.instance.collection('Hackslash_ML').snapshots(),
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
                            domain: 'AI_ML',
                            bgc:0xFF471A00,gc1:0xffFFD84D,gc2:0xfffF9C7A00,
                            out:0xffDF9568,
                            outo:0x66DF9568,
                            team: "Team Grey Interface",
                            back_photo: "images/profile_images/aiml.png",
                            link_photo: "images/profile_images/aiml_in.png"
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