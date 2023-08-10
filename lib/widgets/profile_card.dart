// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:crud/profile.dart';
// import 'package:crud/routes/mapping.dart';
// import 'package:flutter/material.dart';
//
// class ProfileCard extends StatefulWidget {
//   final snap;
//   final domain;
//   const ProfileCard({Key? key, required this.snap,required this.domain}) : super(key: key);
//
//   @override
//   State<ProfileCard> createState() => _ProfileCardState();
// }
//
// class _ProfileCardState extends State<ProfileCard> {
//   @override
//   Widget build(BuildContext context) {
//     String x=widget.snap['studentYear'].toString();
//     String branch=widget.snap['studentBranch'];
//     return InkWell(
//       onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>Profile_Page(y: x, domain: widget.domain, name: widget.snap['studentName'], branch: widget.snap['studentBranch'], post: widget.snap['studentPost'], photo:widget.snap['photoURL'], linkedinLink: widget.snap['StudentURL'])));},
//       child: Container(
//         margin: EdgeInsets.only(top: 20, left: 10,right:5),
//         height: 200,
//         width: 160,
//         // decoration: BoxDecoration(
//         //   boxShadow: [BoxShadow(
//         //       color: Color.fromARGB(255, 187, 186, 186),
//         //       blurRadius: 1.0,offset: Offset(4, 4)
//         //   ),],
//         //   gradient: LinearGradient(
//         //       begin: Alignment.bottomLeft,
//         //       stops: [
//         //         0.1,
//         //         0.4,
//         //         0.6,
//         //         0.9,
//         //       ],
//         //       end: Alignment.topRight,
//         //       colors: [
//         //         Color(0xff5EB6EF),
//         //         Color.fromARGB(255, 162, 218, 255),
//         //         Color(0xFFDCF6FF),
//         //         Color(0xFFDCF6FF),
//         //
//         //       ]
//         //   ),
//         //   borderRadius: BorderRadius.circular(20),
//         // ),
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Container(
//             child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child:Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children:[
//                     Stack(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(top: 20,),
//                             height: 60,
//                             width: 60,
//                             decoration: BoxDecoration(
//                               boxShadow: [BoxShadow(
//                                   color: Color.fromARGB(191, 52, 51, 51),
//                                   blurRadius: 4.0,offset: Offset(2, 2)
//                               ),],
//                               borderRadius: BorderRadius.all(Radius.circular(10)),
//                               image: DecorationImage(
//                                   image: CachedNetworkImageProvider(widget.snap['photoURL']),
//                                   fit: BoxFit.cover),
//                             )),
//                       ],
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(top:10),
//                         child:Text(widget.snap['studentName'],style:TextStyle(color:Color(0xff3E4C5A),fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: 15),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(50)),
//                               color: Color(0xff0050A0),
//                             ),
//                             height: 20,
//                             width: 60,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 x=='2.0'?'2nd Year':'3rd Year',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 253, 253, 253),
//                                     fontSize: 10),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 5,),
//                           Container(
//                             margin: EdgeInsets.only(top: 15),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(50)),
//                               color: Color(0xff0050A0),
//                             ),
//                             height: 20,
//                             width: 80,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 branch,
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 253, 253, 253),
//                                     fontSize: 10),
//                               ),
//                             ),
//                           ),]
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(50)),
//                         color: Color(0xff0050A0),
//                       ),
//                       height: 20,
//                       width: 120,
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           widget.snap['studentPost'],
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 253, 253, 253),
//                               fontSize: 10),
//                         ),
//                       ),)
//                   ],
//                 )
//             ),
//             decoration: BoxDecoration(
//               //color:Color(0xFFDCF6FF),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
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