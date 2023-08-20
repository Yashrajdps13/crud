import "package:cached_network_image/cached_network_image.dart";
import "package:crud/pages/profile_page.dart";
import "package:crud/routes/mapping.dart";
import "package:flutter/material.dart";

class ProfileCard extends StatelessWidget {
  final snap,domain;
  final bgc, gc1, gc2, out;
  final outo;
  final team;
  final back_photo,link_photo;
  ProfileCard(
      {required this.snap,
        required this.domain,
        required this.bgc,
        required this.gc1,
        required this.gc2,
        required this.outo,
        required this.out,
        required this.team,
        required this.back_photo,
        required this.link_photo,
      });

  @override
  Widget build(BuildContext context) {
    String name=snap['studentName'];
    String photo=snap['photoURL'];
    String y=snap['studentYear'].toString();
    String department=snap['studentBranch'];
    String year= y=='2.0'? 'Second':'Third';
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage(snap: snap,team: team,back_photo: back_photo,link_photo: link_photo)));
      },
      child: Container(
          margin: EdgeInsets.only(top: 20),
          height: 120,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Color(outo), offset: Offset(1.5, 1), blurRadius: 2)
            ],
            color: Color.fromARGB(255, 23, 30, 30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                child: Image(
                  image: CachedNetworkImageProvider(photo),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 120,
                ),
              ),
              Container(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(name,
                            style: TextStyle(
                                color: Color.fromARGB(179, 255, 255, 255),
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Color(gc1), Color(gc2)])),
                      height: 24,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "${year} year",
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 253, 253),
                                fontSize: 10,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Container(width: 10),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Color(gc1), Color(gc2)])),
                      height: 24,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "${department} Department",
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 253, 253),
                                fontSize: 10,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              )
            ],
          )),
    );
  }
}