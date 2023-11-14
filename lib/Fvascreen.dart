import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'homescreen.dart';
import 'package:coffeshop_app/register_screen.dart';
import 'loginscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(milliseconds: 3000),
            () => FirebaseAuth.instance.currentUser != null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Coffee_Bean_%26_Tea_Leaf_logo.svg/150px-Coffee_Bean_%26_Tea_Leaf_logo.svg.png"))
          ),
        ),
      ),


    );
  }
}
