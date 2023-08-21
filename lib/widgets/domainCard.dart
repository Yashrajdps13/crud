import "package:flutter/material.dart";
import 'package:crud/routes/mapping.dart';
import 'package:google_fonts/google_fonts.dart';

class Domain extends StatelessWidget {
  String name, tagline, renderpage, people_count;
  int colour;
  int opcolor;
  Domain(
      {required this.name,
      required this.tagline,
      required this.people_count,
      required this.colour,
      required this.renderpage,
      required this.opcolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, renderpage);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff303636),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Color(opcolor),
                  blurRadius: 4.0,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30),
                    Text(
                      name,
                      style: GoogleFonts.ptSansCaption(
                        color: Color(0xffE1E1E1),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 10),
                    Container(
                      width: 150,
                      child: Text(
                        tagline,
                        style: GoogleFonts.ptSansCaption(
                            color: Color(0xff959595),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(colour),
                        ),
                        Container(width: 5),
                        Text(
                          people_count,
                          style: GoogleFonts.ptSansCaption(
                              color: Color(colour),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
