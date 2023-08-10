// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/appbar.dart';
// import '../widgets/profile_card.dart';
// class DSAers extends StatefulWidget {
//   const DSAers({super.key});
//
//   @override
//   State<DSAers> createState() => _DSAersState();
// }
//
// class _DSAersState extends State<DSAers> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(domain: "DSA"),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('Hackslash_dsa').snapshots(),
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
//                 domain: 'DSA'
//               ),)
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/profile_card.dart';
class DSAers extends StatefulWidget {
  const DSAers({super.key});

  @override
  State<DSAers> createState() => _DSAersState();
}

class _DSAersState extends State<DSAers> {
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
                        Text("DSA & CP",style:TextStyle(color: Color(0xffEDCAAA),fontSize: 25,fontWeight: FontWeight.bold),),
                        Container(height:15),
                        Text("Essential knowledge includes algorithms, data structures, problem-solving, coding efficiency, and time complexity analysis."
                          ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50,left: 16,right:16),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Hackslash_dsa').snapshots(),
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
                            domain: 'DSA',
                            bgc:0xFF471A00,gc1:0xff5B4129,gc2:0xffEDCAAA,
                            out:0xffEDCAAA,
                            outo:0x66EDCAAA,
                            team: "Team SigSTP",
                            back_photo: "images/profile_images/dsa.png",
                            link_photo: "images/profile_images/dsa_in.png"
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