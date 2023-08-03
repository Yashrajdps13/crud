import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/profile_card.dart';
import '../widgets/old_profile_screen.dart';
class Web_developers extends StatefulWidget {
  const Web_developers({super.key});

  @override
  State<Web_developers> createState() => _Web_developersState();
}

class _Web_developersState extends State<Web_developers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(domain: "Web Development",),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Hackslash_Web').snapshots(),
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
                mainAxisSpacing: 30,
                childAspectRatio: 160/200,
              ),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index)=> Container(child: ProfileCard(
                snap: snapshot.data?.docs[index].data(),
                domain: 'Web Development'
              ),)
          );
        },
      ),
    );
  }
}