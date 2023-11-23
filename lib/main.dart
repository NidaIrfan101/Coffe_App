import 'package:coffeshop_app/cart.dart';
import 'package:coffeshop_app/demoprofilepage.dart';
import 'package:coffeshop_app/fav.dart';
import 'package:coffeshop_app/profile_screen.dart';
import 'package:coffeshop_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      home: demoprofilepage(),
    );
  }
}
class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {

  int selectedIndex=0;
void pageShifter(index){
  setState(() {
    selectedIndex=index;
  });
}

List<Widget> logScreen=[
  HomeScreen(),
  RegisterScreen(),
  LoginScreen(),

];

List<Widget> myScreens=[
  HomeScreen(),
  cart(),
  favscreen(),
  profilescreen(),
];
Future login_user()async{
  SharedPreferences userEmail = await SharedPreferences.getInstance();
  return userEmail.getBool("UserLoggedIn");
}

bool? check;
void initState() {
  // TODO: implement initState
  login_user().then((value){
    setState((){
      check = value;
    });
  });
  super.initState();
}

  @override
  Widget build(BuildContext context) {
  print(check);
    return Scaffold(
        body:check==true?myScreens[selectedIndex]:logScreen[selectedIndex],

        bottomNavigationBar:check==true?  ClipRRect(

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
                  icon: Icon(Icons.favorite_border_rounded,color: Colors.black,size: 35.0,),
                  label: "fav"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded,color: Colors.black,size: 35.0,),
                  label: "Cart"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: Colors.black,size: 35.0,),
                  label: "Profile"
              ),

            ],

          ),

        ):
        ClipRRect(
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
                  icon: Icon(Icons.assignment_ind_outlined,color: Colors.black,size: 35.0,),
                  label: "Register"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: Colors.black,size: 35.0,),
                  label: "Profile"
              ),


            ],

          ),

        ),


    );
  }
}
// int selectedIndex=0;
// void pageShifter(index){
//   setState(() {
//     selectedIndex=index;
//   });
// }
//
// List<Widget> myScreens=[
//   HomePage(),
//   AddtoCart(),
//   favourite(),
//   profile(),
// ];
//
// List<Widget> logScreens=[
//   HomePage(),
//   AddtoCart(),
//   favourite(),
//   userProfile(),
// ];
// Future login_user()async{
//   SharedPreferences userLoggedIn = await SharedPreferences.getInstance();
//   return userLoggedIn.getBool("UserLoggedIn");
// }
//
// bool? check;
// void initState() {
//   // TODO: implement initState
//   login_user().then((value){
//     setState((){
//       check = value;
//     });
//   });
//   super.initState();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body:check==false?myScreens[selectedIndex]:logScreens[selectedIndex],
//
//
//
//       bottomNavigationBar:check==true? CurvedNavigationBar(
//       index: selectedIndex,
//       backgroundColor: Color(0xffffffff),
//   color: Color(0xf0000523),
//   onTap: pageShifter,
//   items: [
//   Icon(Icons.home_filled, color: selectedIndex!=0? Color(0xffffffff):
//   Color(0xffff4914),),
//   Icon(Icons.card_travel,color:  selectedIndex!=1? Color(0xffffffff):
//   Color(0xffff4914),),
//   Icon(CupertinoIcons.heart,color: selectedIndex!=2? Color(0xffffffff):
//   Color(0xffff4914),),
//   Icon(Icons.person_2_outlined,color:  selectedIndex!=3? Color(0xffffffff):
//   Color(0xffff4914),)
//   ]):
//   CurvedNavigationBar(
//   index: selectedIndex,
//   backgroundColor: Color(0xffffffff),
//   color: Color(0xf0000523),
//   onTap: pageShifter,
//   items: [
//   Icon(Icons.home_filled, color: selectedIndex!=0? Color(0xffffffff):
//   Color(0xffff4914),),
//   Icon(Icons.card_travel,color:  selectedIndex!=1? Color(0xffffffff):
//   Color(0xffff4914),),
//   Icon(CupertinoIcons.heart,color: selectedIndex!=2? Color(0xffffffff):
//   Color(0xffff4914),),
//   Icon(Icons.person_2_outlined,color:  selectedIndex!=3? Color(0xffffffff):
//   Color(0xffff4914),)
//   ]),