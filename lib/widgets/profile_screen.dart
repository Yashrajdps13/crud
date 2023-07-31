import 'package:crud/utils/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> _launchURL(String url) async{
  final Uri _url=Uri.parse(url);
  if(!await launchUrl(
      _url,
    mode: LaunchMode.externalApplication
  )){
    throw Exception('Could not launch $_url');
  }
}
class ProfileCard extends StatelessWidget {
  final snap;
  const ProfileCard({Key? key, required this.snap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4).copyWith(right: 0),
        // width: 333,
        height: 125,
        decoration: ShapeDecoration(
          color: Color(0xFFFFFEE9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 49,
                backgroundImage: NetworkImage(
                  snap['photoURL']
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      snap['studentName'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'JejuGothic',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      snap['studentPost'],
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9,
                        fontFamily: 'JejuGothic',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      '3rd Year in BTech Computer Science',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 9),
                    InkWell(
                      onTap: () { _launchURL(snap['StudentURL']);},
                      child: Icon(
                          FontAwesomeIcons.linkedin,color: Color(0xFF0072b1),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
