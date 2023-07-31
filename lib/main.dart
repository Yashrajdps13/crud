// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:crud/pages/landingPage.dart';
// // import 'package:crud/routes/mapping.dart';
// // import 'package:crud/pages/AI_ML.dart';
// // import 'package:crud/pages/Web_dev.dart';
// // import 'package:crud/pages/android_dev.dart';
// // import 'package:crud/pages/dsa.dart';
// // import 'package:crud/pages/designing.dart';
// //
// //
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         routes:{
// //           "/":(context) => Landing_Page(),
// //           MyRoutes.landingRoute:(context)=>Landing_Page(),
// //           MyRoutes.AI_MLRoute:(context)=>AI_ML(),
// //           MyRoutes.Web_DevRoute:(context)=>Web_developers(),
// //           MyRoutes.Android_DevRoute:(context)=>Androiders(),
// //           MyRoutes.DSARoute:(context)=>DSAers(),
// //           MyRoutes.DesigningRoute:(context)=>Designers(),
// //         }
// //     );
// //   }
// // }
// //
// //
// //
// //
import 'package:crud/resources/storagemethods.dart';
import 'package:crud/utils/photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyCfqtAAOGDeIKRYYVs1keg5guXuAoXOwts",
          appId: "1:677174464805:web:9c30e05f51632f87710acc",
          messagingSenderId: "677174464805",
          projectId: "myfluttercollege-afb50",
          storageBucket: "myfluttercollege-afb50.appspot.com",
        )
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? studentName,studentPost,StudentURL;
  double? studentYear;
  String? studentIndex;
  String? studentBranch;
  Uint8List? image;
  void selectImage() async {
    Uint8List im= await pickImage(ImageSource.gallery);
    setState(() {
      image=im;
    });
  }
  getStudentName(name){
    this.studentName=name;
  }
  getstudentPost(ID){
    this.studentPost=ID;
  }
  getstudentYear(studentYear){
    this.studentYear=double.tryParse(studentYear);
  }
  getStudentURL(gpa){
    this.StudentURL=gpa;
  }
  getStudentIndex(gpa){
    this.studentIndex=gpa;
  }
  getStudentBranch(branch){
    this.studentBranch=branch;
  }
  Future<String> createData() async {
    String res="Some error has occured";
    DocumentReference documentReference=FirebaseFirestore.instance.collection("Hackslash_Kotlin").doc(studentIndex);
    String photoUrl= await StorageMethods().uploadImageToStorage('profile_Management',image!,false,studentName!);
    Map<String, dynamic> students= {
      "studentName": studentName,
      "studentPost": studentPost,
      "StudentURL": StudentURL,
      "studentYear": studentYear,
      "studentIndex": studentIndex,
      "photoURL": photoUrl,
      "studentBranch": studentBranch
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName created");
      res="Success";
    });
    print(res);
    return res;
  }
  readData(){
    DocumentReference documentReference=FirebaseFirestore.instance.collection("MyStudents").doc(studentIndex);

    documentReference.get().then((snapshot){
      print(snapshot.data());
    });
  }
  updateData(){
    DocumentReference documentReference=FirebaseFirestore.instance.collection("MyStudents").doc(studentIndex);

    Map<String, dynamic> students= {
      "studentName": studentName,
      "studentPost": studentPost,
      "StudentURL": StudentURL,
      "studentYear": studentYear,
      "studentIndex": studentIndex
    };
    documentReference.set(students).whenComplete(() {
      print("$studentName updated");
    });
  }
  deleteData(){
    DocumentReference documentReference=FirebaseFirestore.instance.collection("MyStudents").doc(studentIndex);
    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My Flutter College')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              children: [
                image!=null?CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(image!),
                ):const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt1ceyneFkZchgkrwN7dZxWNl_C5Dctvc5BzNh_rEzPQ&s'),
                ),
                Positioned(bottom: -10,left: 80,child: IconButton(onPressed: selectImage, icon: const Icon(Icons.add_a_photo)))
              ],
            ),
            SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                        )
                    ),
                    onChanged: (String name){
                      getStudentName(name);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Post",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                        )
                    ),
                    onChanged: (String ID){
                      getstudentPost(ID);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Year",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                        )
                    ),
                    onChanged: (String studentYear){
                      getstudentYear(studentYear);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Branch",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                        )
                    ),
                    onChanged: (String studentBranch){
                      getStudentBranch(studentBranch);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "LinkedIn",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                        )
                    ),
                    onChanged: (String cgpa){
                      getStudentURL(cgpa);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Index",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                        )
                    ),
                    onChanged: (String cgpa){
                      getStudentIndex(cgpa);
                    },
                  ),
                ),
              ],
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    createData();
                  },
                  child: Text('Create'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      readData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                    child: Text('Read')
                ),
                ElevatedButton(
                    onPressed: () {
                      updateData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                    child: Text('Update')
                ),
                ElevatedButton(
                    onPressed: () {
                      deleteData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                    child: Text('Delete')
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:crud/pages/landingPage.dart';
// import 'package:crud/routes/mapping.dart';
// import 'package:crud/pages/AI_ML.dart';
// import 'package:crud/pages/Web_dev.dart';
// import 'package:crud/pages/android_dev.dart';
// import 'package:crud/pages/dsa.dart';
// import 'package:crud/pages/designing.dart';
//
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//
//         routes:{
//           "/":(context) => Landing_Page(),
//           MyRoutes.landingRoute:(context)=>Landing_Page(),
//           MyRoutes.AI_MLRoute:(context)=>AI_ML(),
//           MyRoutes.Web_DevRoute:(context)=>Web_developers(),
//           MyRoutes.Android_DevRoute:(context)=>Androiders(),
//           MyRoutes.DSARoute:(context)=>DSAers(),
//           MyRoutes.DesigningRoute:(context)=>Designers(),
//         }
//     );
//   }
// }