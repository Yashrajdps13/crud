import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_screen.dart';

class Designers extends StatefulWidget {
  const Designers({super.key});

  @override
  State<Designers> createState() => _DesignersState();
}

class _DesignersState extends State<Designers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_Design').snapshots(),
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