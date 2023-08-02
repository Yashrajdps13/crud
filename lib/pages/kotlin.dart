import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_screen.dart';

class KotlinPage extends StatefulWidget {
  const KotlinPage({super.key});

  @override
  State<KotlinPage> createState() => _KotlinPageState();
}

class _KotlinPageState extends State<KotlinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_Kotlin').snapshots(),
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