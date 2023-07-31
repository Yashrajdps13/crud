import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/widgets/profile_screen.dart';
import 'package:flutter/material.dart';

class AI_ML extends StatefulWidget {
  const AI_ML({super.key});

  @override
  State<AI_ML> createState() => _AI_MLState();
}

class _AI_MLState extends State<AI_ML> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Row(children: [
          Padding(padding: EdgeInsets.fromLTRB(99, 0, 0, 0)),
          Text(
            'App name',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(width: 10),
          Image.asset(
            "images/Batman_Logo.png",
            fit: BoxFit.contain,
            height: 40,
          ),
        ]),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Management').snapshots(),
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