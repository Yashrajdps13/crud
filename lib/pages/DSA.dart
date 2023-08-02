import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_screen.dart';
class DSAers extends StatefulWidget {
  const DSAers({super.key});

  @override
  State<DSAers> createState() => _DSAersState();
}

class _DSAersState extends State<DSAers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_dsa').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            //itemCount: snapshot.data!.docs.length,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index)=> Container(child: ProfileCard(
                snap: snapshot.data?.docs[index].data(),
              ),)
          );
        },
      ),
    );
  }
}