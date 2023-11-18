import 'package:coffeshop_app/profile_screen.dart';
import 'package:coffeshop_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'description screen.dart';
import 'firebase_options.dart';
import 'homescreen.dart';
import 'package:coffeshop_app/register_screen.dart';
import 'loginscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottomnav(),
    );
  }
}
class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int selectedIndex = 0;

  void pageShifter(index){
    setState(() {
      selectedIndex=index;
    });
  }

  List<Widget>myScreens=[HomeScreen(),LoginScreen(),RegisterScreen(),profilescreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],

        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),
          child:BottomNavigationBar(
            //elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey.shade200,
            currentIndex: selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.black,
            onTap: pageShifter,
            unselectedItemColor: Colors.deepPurple,
            items: [

              BottomNavigationBarItem(
                  icon: Icon(Icons.home,color: Colors.black,size: 35.0,),
                  label: "Home"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.login,color: Colors.black,size: 35.0,),
                  label: "LogIn"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.logout,color: Colors.black,size: 35.0,),
                  label: "LogOut"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: Colors.black,size: 35.0,),
                  label: "Profile"
              ),

            ],

          ),

        )
    );
  }
}
