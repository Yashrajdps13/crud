import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_card.dart';
import '../widgets/old_profile_screen.dart';
class DSAers extends StatefulWidget {
  const DSAers({super.key});

  @override
  State<DSAers> createState() => _DSAersState();
}

class _DSAersState extends State<DSAers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(domain: "DSA"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_dsa').snapshots(),
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
                domain: 'DSA'
              ),)
          );
        },
      ),
    );
  }
}