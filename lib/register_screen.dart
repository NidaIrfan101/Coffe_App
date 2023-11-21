import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'loginscreen.dart';
import 'homescreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}



TextEditingController name=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController pass =TextEditingController();
TextEditingController age=TextEditingController();




var _formkey =GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {

  void userInsertwithImage()async{
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("Images").child(Uuid().v1()).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    UserInsert(imageURL: downloadURL);
  }

  String userID = Uuid().v1();
  void UserInsert({String? imageURL})async{

    Map<String , dynamic> userDetails ={
      "userId":userID,
      "user-image":imageURL,
      "name":name.text.toString(),
      "age":age.text.toString(),
      "email":email.text.toString(),
      "pass":pass.text.toString(),
    };
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString());
      await FirebaseFirestore.instance.collection("userData").doc(userID).set(userDetails);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),));
    } on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${ex.code.toString()}")));
    }
    // await FirebaseFirestore.instance.collection("userData").add(userDetails);


  }
  File? userProfile;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20,),
          width: double.infinity,
          height: 690,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.bhmpics.com/downloads/purple-ombre-Wallpapers/64.abstract-watercolor-background-gradient-light-purple-lilac-to-dark-blue-ink-ombre-hand-drawn-illustration-texture-paper-164409422.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            children:[

              Form(
                key: _formkey,
                child: Column(
                  children: [

                    SizedBox(height: 20,),

                    Text("InsertData",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),),

                    SizedBox(height: 20,),

                    GestureDetector(
                      onTap: ()async{
                        XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                        if (selectedImage!=null) {
                          File convertedImage = File(selectedImage.path);
                          setState(() {
                            userProfile = convertedImage;
                          });

                        } else {

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Image Not Selected")));

                        }
                      },

                      child: userProfile != null?CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey.shade700,


                        backgroundImage: userProfile!=null?FileImage(userProfile!):null,

                      ):CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey.shade700,


                        // backgroundImage:NetworkImage(),

                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal:20),
                        child:TextFormField(
                            controller: name,
                            validator: (value){
                              if (value==null || value.isEmpty || value==" ") {
                                return "Name is required ";
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Enter your name",style: GoogleFonts.poppins(fontSize: 14,color: Colors.black),),
                              border: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.lime,
                                  width: 20,

                                ),
                              ),
                              prefixIcon: Icon(Icons.person),
                            )
                        )
                    ),

                    SizedBox(height:20,),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal:20),
                        child:TextFormField(
                            controller: age,
                            validator: (value){
                              if (value==null || value.isEmpty || value==" ") {
                                return "Age is required ";
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Enter your age",style: GoogleFonts.poppins(fontSize: 14,color: Colors.black),),
                              border: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.lime,

                                ),
                              ),
                              prefixIcon: Icon(Icons.eighteen_up_rating_outlined),
                            )
                        )
                    ),



                    SizedBox(height:20,),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal:20),
                        child:TextFormField(
                            controller: email,
                            validator: (value){
                              if (value==null || value.isEmpty || value==" ") {
                                return "Email is required ";
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Enter your email",style: GoogleFonts.poppins(fontSize: 14,color: Colors.black),),
                              border: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.lime
                                ),
                              ),
                              prefixIcon: Icon(Icons.mail_lock),
                            )
                        )
                    ),

                    SizedBox(height: 20,),

                    Container(
                        margin: EdgeInsets.symmetric(horizontal:20),
                        child:TextFormField(
                            controller: pass,
                            validator: (value){
                              if (value==null || value.isEmpty || value==" ") {
                                return "Password is required ";
                              }
                            },
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              label: Text("Enter your password",style: GoogleFonts.poppins(fontSize: 14,color: Colors.black),),
                              border: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.lime
                                ),
                              ),
                              prefixIcon: Icon(Icons.key),
                            )
                        )
                    ),



                    SizedBox(height:20,),



                    ElevatedButton(onPressed: (){

                      userInsertwithImage();

                    }, child: Text("Register User")),
                    SizedBox(height: 30,),

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
