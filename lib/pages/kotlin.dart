import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_card.dart';
import '../widgets/old_profile_screen.dart';

class KotlinPage extends StatefulWidget {
  const KotlinPage({super.key});

  @override
  State<KotlinPage> createState() => _KotlinPageState();
}

class _KotlinPageState extends State<KotlinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(domain: "Kotlin",),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_Kotlin').snapshots(),
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
                domain: 'Kotlin'
              ),)
          );
        },
      ),
    );
  }
}