import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_card.dart';
import '../widgets/old_profile_screen.dart';

class AI_ML extends StatefulWidget {
  const AI_ML({super.key});

  @override
  State<AI_ML> createState() => _AI_MLState();
}

class _AI_MLState extends State<AI_ML> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(domain: "AI & ML"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_ML').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            //itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 160/200,
              ),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index)=> Container(child: ProfileCard(
                snap: snapshot.data?.docs[index].data(),
                domain: 'AI & ML',
              ),)
          );
        },
      ),
    );
  }
}