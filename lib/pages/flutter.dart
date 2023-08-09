// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/appbar.dart';
// import '../widgets/profile_card.dart';
//
//
//
//
// class FlutterPage extends StatefulWidget {
//   const FlutterPage({super.key});
//
//   @override
//   State<FlutterPage> createState() => _FlutterPageState();
// }
//
// class _FlutterPageState extends State<FlutterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(domain: "Flutter"),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('Hackslash_flutter').snapshots(),
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
//                 domain: 'Flutter'
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



class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key});

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
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
                          Container(height:130),
                          Text("Flutter",style:TextStyle(color: Color(0xff69E5E0),fontSize: 25,fontWeight: FontWeight.bold),),
                          Container(height:15),
                          Text("Knowledge of Dart programming, widget composition, UI/UX design, state management, and APIs is vital"
                            ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50,left: 16,right:16),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Hackslash_flutter').snapshots(),
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
                              domain: 'Flutter',
                              bgc:0xFF004703,gc1:0xff037777,gc2:0xff69E5E0,
                              out:0xff69E5E0
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