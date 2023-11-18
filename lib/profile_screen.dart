import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'editprofile.dart';
import 'main.dart';
import 'package:coffeshop_app/register_screen.dart';
import 'homescreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';


class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {

  Future getUser()async{
    SharedPreferences userLog = await SharedPreferences.getInstance();
    return userLog.getString('userID');
  }
  String uID = '';
  @override
  void initState() {
    // TODO: implement initState
    getUser().then((value) {
      setState(() {
        uID = value;
      });
    });
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         backgroundColor: Colors.white,
       leading:IconButton(onPressed: (){
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => HomeScreen()),
         );
       }, icon: const Icon(Icons.arrow_circle_left,color: Colors.black,)),
       title: Text("Profile",style: GoogleFonts.poppins(
           fontSize: 16,
         color: Colors.black
       ),),
     actions: [
       IconButton(onPressed: (){}, icon: const Icon(Icons.logout,color: Colors.black,))
     ],
     ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
        padding: EdgeInsets.only(left: 10),
          child: Column(
           children: [
             Stack(
               children: [

                 SizedBox(
                   width: 120, height: 120,

                   child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image(image: NetworkImage(""))
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


             SizedBox(height: 10,),
             Text("Name",style:GoogleFonts.poppins(
               fontSize: 16,
               fontWeight: FontWeight.w600
             ),),
             Text("Email",style:GoogleFonts.poppins(
                 fontSize: 14,
                 fontWeight: FontWeight.w400
             ),),
             SizedBox(height: 20,),

           SizedBox(width: 250,
             child: ElevatedButton(onPressed:(){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => EditProfile()),
               );
             }, child:Text("Edit Profile",style: GoogleFonts.poppins(
               fontSize: 15,
               fontWeight: FontWeight.w500,
               color: Colors.white
             ),),
               style:ElevatedButton.styleFrom(
                   backgroundColor: Colors.deepPurple ,
                 side: BorderSide.none,
                 shape: StadiumBorder()),),
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
             child: const Icon(Icons.settings,color: Colors.black,),
           ),
           title: Text("Settings",style: GoogleFonts.poppins(
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

             ListTile(
               leading: Container(
                 width: 40,height: 40,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     color: Colors.black.withOpacity(0.1)
                 ),
                 child: const Icon(Icons.monetization_on_outlined,color: Colors.black,),
               ),
               title: Text("Billing Details",style: GoogleFonts.poppins(
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

             ListTile(
               leading: Container(
                 width: 40,height: 40,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     color: Colors.black.withOpacity(0.1)
                 ),
                 child: const Icon(Icons.manage_accounts,color: Colors.black,),
               ),
               title: Text("User Management",style: GoogleFonts.poppins(
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

             SizedBox(height: 15,),
             const Divider(color: Colors.grey,),



             ListTile(
               leading: Container(
                 width: 40,height: 40,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     color: Colors.black.withOpacity(0.1)
                 ),
                 child: const Icon(Icons.info_outline,color: Colors.black,),
               ),
               title: Text("Information",style: GoogleFonts.poppins(
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

             ListTile(
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




           ],
          ),
        ),
      ),

    );
  }
}

