import 'package:flutter/material.dart';

class KotlinPage extends StatefulWidget {
  const KotlinPage({super.key});

  @override
  State<KotlinPage> createState() => _KotlinPageState();
}

class _KotlinPageState extends State<KotlinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Kotlin")),

    );
  }
}