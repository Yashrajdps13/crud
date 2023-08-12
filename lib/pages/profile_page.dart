import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
Future<void> _launchURL(String url) async{
  final Uri _url=Uri.parse(url);
  if(!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication
  )){
    throw Exception('Could not launch $_url');
  }
}

class ProfilePage extends StatelessWidget {
  final snap;
  final team;
  final back_photo,link_photo;
  const ProfilePage({Key? key, required this.snap, required this.team, required this.back_photo, required this.link_photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String y=snap['studentYear'].toString();
    String year= y=='2.0'?"2nd":"3rd";
    String Branch;
    String b=snap['studentBranch'];
    if(b=="CSE"){
      Branch="Computer Science and Engineering";
    }else if(b=="ECE"){
      Branch="Electronics and Communication Engineering";
    }else if(b=="EE"){
      Branch="Electrical Engineering";
    }else if(b=="ME"){
      Branch="Mechanical Engineering";
    }else if(b=='CE'){
      Branch="Civil Engineering";
    }else if(b=="MNC"){
      Branch="Mathematics and Computing";
    }else{
      Branch="Material Science Engineering";
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipPath(
                      clipper: shapeClip(),
                      child: Container(
                          height: 270,
                          decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xff2C6664),
                                    blurRadius: 2,
                                    offset: Offset(4, 4))
                              ]),
                          child: Image(
                            image: AssetImage(back_photo),
                            fit: BoxFit.cover,
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 180, left: 0),
                    height: 143,
                    width: 143,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(120)),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(snap['photoURL']),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left:35,
                    bottom:240,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image(
                          image: AssetImage('images/gp19.png'),
                          color:Color(0xffffE1E1E1)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10,right:25),
                child: Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snap['studentName'],
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffE5E5E5))),
                            Container(height: 10),
                            Text(snap['studentPost'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffC2C2C2))),
                            // Container(height:5),
                            Text(team,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff959595)))
                          ],
                        ),
                        Spacer(),
                        snap['StudentURL']!=null?GestureDetector(
                          onTap: () { _launchURL(snap['StudentURL']);},
                          child: Image(
                              image: AssetImage(link_photo), height: 65,
                          ),
                        ):Text('')
                      ],
                    )),
              ),
              Container(
                height: 70,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 470,
                decoration: BoxDecoration(
                    color: Color(0x66141a1a),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 40, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [

                          Text("$year year",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffE5E5E5))),
                          Spacer(),
                          Container(
                            width: 150,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                Branch,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffE5E5E5)),
                              ),
                            ),),

                        ],
                      ),
                      Container(height:40),
                      Text("Expertise:",style: TextStyle(color:Color(0xffE5E5E5),fontSize: 15,
                        fontWeight: FontWeight.w500,),),
                      Divider(height: 20,
                        color: Colors.white70,thickness: 1,
                      ),
                      // Container(height: 10,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //   children: [
                      //     Icon(Icons.circle_outlined,color: Color(0xff69E5E0),size: 15,),
                      //     Container(width:5),
                      //     Container(
                      //       width:120,
                      //       child: Text(snap['skills'][0],style:TextStyle(
                      //           color:Color(0xffC2C2C2),fontSize: 12
                      //       )),
                      //     ),
                      //     Container(width:10),
                      //
                      //     Icon(Icons.circle_outlined,color: Color(0xff69E5E0),size: 15,),
                      //     Container(width:5),
                      //     Container(
                      //       width:120,
                      //       child: Text(snap['skills'][1],style:TextStyle(
                      //           color:Color(0xffC2C2C2),fontSize: 12
                      //       )),
                      //     ),
                      //   ],
                      // ),
                      //
                      // Container(height:10),
                      //
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //   children: [
                      //     Icon(Icons.circle_outlined,color: Color(0xff69E5E0),size: 15,),
                      //     Container(width:5),
                      //     Container(
                      //       width:120,
                      //       child: Text(snap['skills'][2],style:TextStyle(
                      //           color:Color(0xffC2C2C2),fontSize: 12
                      //       )),
                      //     ),
                      //
                      //     Container(width:10),
                      //
                      //     Icon(Icons.circle_outlined,color: Color(0xff69E5E0),size: 15,),
                      //     Container(width:5),
                      //     Container(
                      //       width:120,
                      //       child: Text(snap['skills'][3],style:TextStyle(
                      //           color:Color(0xffC2C2C2),fontSize: 12
                      //       )),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class shapeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    // var firstStart = Offset(size.width / 2, size.height + 20);
    var firstEnd = Offset(size.width, size.height - 118.0);
    path.lineTo(firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}