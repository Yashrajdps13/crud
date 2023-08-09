import "package:flutter/material.dart";

import "../routes/mapping.dart";
import "../widgets/drawer.dart";


class AppDevPage extends StatefulWidget {
  const AppDevPage({super.key});

  @override
  State<AppDevPage> createState() => _AppDevPageState();
}

class _AppDevPageState extends State<AppDevPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1D1D1D), Color(0xff1F3D3B)])),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom:10),
            child: Column(
              children: [
                Container(
                    height:190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)) ,
                      gradient: LinearGradient(
                        begin:Alignment.topCenter,end:Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(0, 0, 0, 0),Color.fromARGB(63, 114, 114, 114),
                        ],
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(left:30.0,right:30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height:130),
                          Text("App Development",style:TextStyle(color: Color(0xff69E5E0),fontSize: 25,fontWeight: FontWeight.bold),),


                        ],
                      ),
                    )


                ),
                Padding(padding: EdgeInsets.only(left: 30,right:30,top:30),
                    child:Row(children: [
                      GestureDetector(
                        onTap:() => Navigator.pushNamed(context, MyRoutes.FlutterRoute),
                        child: Container(
                            height:180,width:140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                boxShadow: [
                                  BoxShadow(color: Color(0xff69E5E0), offset: Offset(2, 2), blurRadius: 2)
                                ],
                                gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.center,colors:[Color(0xff004747),Color(0xff252525)])
                            ),
                            child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                                  child: Image.asset("images/flutter_cat.png",height: 110,fit: BoxFit.cover,),
                                ),
                                Container(height: 20,),
                                Row(children: [
                                  Container(width:20),
                                  Text("Flutter",style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600))])
                              ],
                            )
                        ),
                      ),Container(width:20),
                      GestureDetector(
                        onTap:() => Navigator.pushNamed(context, MyRoutes.KotlinRoute),
                        child: Container(
                            height:180,width:140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                boxShadow: [
                                  BoxShadow(color: Color(0xff69E5E0), offset: Offset(2, 2), blurRadius: 2)
                                ],
                                gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.center,colors:[Color(0xff004747),Color(0xff252525)])
                            ),
                            child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                                  child: Image.asset("images/kotlin_cat.png",height: 110,fit: BoxFit.cover,),
                                ),
                                Container(height: 20,),
                                Row(children: [
                                  Container(width:20),
                                  Text("Kotlin",style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600))])
                              ],
                            )
                        ),
                      )

                    ],)
                )
              ],
            ),
          ),
        ),


      ),

    );
  }
}