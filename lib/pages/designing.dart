import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/profile_card.dart';

class Designers extends StatefulWidget {
  const Designers({super.key});

  @override
  State<Designers> createState() => _DesignersState();
}

class _DesignersState extends State<Designers> {
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
                          Text("UI & UX",style:TextStyle(color: Color(0xffFDFF8D),fontSize: 25,fontWeight: FontWeight.bold),),
                          Container(height:15),
                          Text("Essential knowledge includes design principles, user research, wireframing, prototyping, visual design, and usability testing"
                            ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50,left: 16,right:16),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Hackslash_Design').snapshots(),
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
                              domain: 'UI_UX',
                              bgc:0xFF004703,gc1:0xff6D6E3C,gc2:0xFFEFF233,
                              out:0xffFDFF8D,
                              outo:0x66FDFF8D,
                              team: "Design Team",
                              back_photo: "images/profile_images/uiux.png",
                              link_photo: "images/profile_images/uiux_in.png"
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