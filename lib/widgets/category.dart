import "package:flutter/material.dart";
import 'package:crud/routes/mapping.dart';

class Domain extends StatelessWidget {

  String name,imageURL,renderpage;
  Domain({required this.name,required this.imageURL,required this.renderpage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, renderpage);
      },
      child: Stack(children: [
        Container(
          child: Image(
            image: AssetImage(imageURL),
          ),
        ),
        Container(
          height: 158,
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        )
      ]),
    );
  }
}