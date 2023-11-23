import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'editprofile.dart';
import 'main.dart';
import 'package:coffeshop_app/register_screen.dart';
import 'homescreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

class demoprofilepage extends StatefulWidget {
  const demoprofilepage({super.key});

  @override
  State<demoprofilepage> createState() => _demoprofilepageState();
}

class _demoprofilepageState extends State<demoprofilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 22,),

                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [

                          SizedBox(
                            width: 120, height: 120,

                            child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image(image: NetworkImage(''))
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.purple.withOpacity(0.1)
                              ),
                              child: Icon(Icons.edit,color: Colors.black,size: 20,),
                            ),
                          ),


                        ],
                      ),

                      SizedBox(height: 30,),

                      const Divider(),
                      SizedBox(height: 10,),

                      //MENU SECTION//



                      ListTile(
                        leading: Container(
                          width: 40,height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black.withOpacity(0.1)
                          ),
                          child: const Icon(Icons.person,color: Colors.black,),
                        ),
                        title: Text("Register/Login",style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                        trailing:Container(
                          width: 30,height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black.withOpacity(0.1)
                          ),
                          child: const Icon(Icons.arrow_right_alt,color: Colors.black,),
                        ),
                      ),


                      SizedBox(height: 10,),

                      GestureDetector(
                        onTap: ()async{
                          SharedPreferences userEmail = await SharedPreferences.getInstance();
                          userEmail.setBool("UserLoggedIn",false);
                          userEmail.setString("uEmail",'');
                          Navigator.push(context, MaterialPageRoute(builder: (context) => bottomnav(),));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black.withOpacity(0.1)
                            ),
                            child: const Icon(Icons.logout,color: Colors.black,),
                          ),
                          title: Text("LogOut",style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.red
                          ),),
                          trailing:Container(
                            width: 30,height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black.withOpacity(0.1)
                            ),
                            child: const Icon(Icons.arrow_right_alt,color: Colors.black,),
                          ),
                        ),
                      ),




                    ],
                  ),
                ),

              ],
            ),
          ),
    );
  }
}
