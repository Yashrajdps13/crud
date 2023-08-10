// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../widgets/appbar.dart';
// import '../widgets/profile_card.dart';
//
// class AI_ML extends StatefulWidget {
//   const AI_ML({super.key});
//
//   @override
//   State<AI_ML> createState() => _AI_MLState();
// }
//
// class _AI_MLState extends State<AI_ML> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(domain: "AI & ML"),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('Hackslash_ML').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
//           if(snapshot.connectionState==ConnectionState.waiting){
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return GridView.builder(
//             //itemCount: snapshot.data!.docs.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 childAspectRatio: 160/200,
//               ),
//               itemCount: snapshot.data?.docs.length,
//               itemBuilder: (context, index)=> Container(child: ProfileCard(
//                 snap: snapshot.data?.docs[index].data(),
//                 domain: 'AI & ML',
//               ),)
//           );
//         },
//       ),
//     );
//   }
// }
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
                    padding: const EdgeInsets.only(left:30.0,right:30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height:130),
                        Text("AI & ML",style:TextStyle(color: Color(0xffDF9568),fontSize: 25,fontWeight: FontWeight.bold),),
                        Container(height:15),
                        Text("Knowledge of algorithms, data preprocessing, statistical analysis, programming, and model evaluation is essential."
                          ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
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
                            bgc:0xFF471A00,gc1:0xffFD6203,gc2:0xffC89677,
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