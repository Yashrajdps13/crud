import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_screen.dart';

class AI_ML extends StatefulWidget {
  const AI_ML({super.key});

  @override
  State<AI_ML> createState() => _AI_MLState();
}

class _AI_MLState extends State<AI_ML> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_ML').snapshots(),
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