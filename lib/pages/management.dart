// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crud/widgets/appbar.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/profile_card.dart';
//
// class ManagementPage extends StatefulWidget {
//   const ManagementPage({super.key});
//
//   @override
//   State<ManagementPage> createState() => _ManagementPageState();
// }
//
// class _ManagementPageState extends State<ManagementPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(domain: "Management",),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('Management').snapshots(),
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
//                 domain: 'Management'
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

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        child: SingleChildScrollView(
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
                        Text("Management",style:TextStyle(color: Color(0xffD4B9FE),fontSize: 25,fontWeight: FontWeight.bold),),
                        Container(height:15),
                        Text("Knowledge areas include event planning, project management, team coordination, communication skills and budgeting."
                          ,style:TextStyle(color: Color(0xff959595),fontSize: 14,fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50,left:16,right:16,top:0),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Management').snapshots(),
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
                        itemBuilder: (context, index)=> Container(child: ProfileCard(
                            snap: snapshot.data?.docs[index].data(),
                            domain: 'Management',
                            bgc:0xFF004703,
                            gc1:0xff751DFF,
                            gc2:0xffC5A0FF,
                            out:0xffD0B1FF,
                            outo:0x66D0B1FF,
                          team: "Management Team",
                            back_photo: "images/profile_images/management.png",
                            link_photo: "images/profile_images/management_in.png"
                        ),)
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