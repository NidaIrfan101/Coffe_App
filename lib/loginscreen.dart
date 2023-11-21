import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:coffeshop_app/register_screen.dart';
import 'homescreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


// TEXT EDITOR USED TO FETCH VALUES AND SHOW ON CONSOLE

  TextEditingController email=TextEditingController();
  TextEditingController pass =TextEditingController();

  void UserLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString());
      SharedPreferences userEmail = await SharedPreferences.getInstance();
      userEmail.setString("uEmail", email.text.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomnav(),));
    } on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${ex.code.toString()}")));
    }

  }

  var _formkey =GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    pass.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        physics: const ScrollPhysics(),


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
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Coffee_Bean_%26_Tea_Leaf_logo.svg/150px-Coffee_Bean_%26_Tea_Leaf_logo.svg.png"),
                  ),
                ),
              ),

              Form(
                key: _formkey,
                child: Column(
                  children: [

                    SizedBox(height: 20,),

                    Text("LOG IN YOURSELF!",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black),),

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
                              label: Text("Enter your email"),
                              border: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.purpleAccent,

                                ),
                              ),
                              prefixIcon: Icon(Icons.person),
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
                              label: Text("Enter your password"),
                              border: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.purpleAccent
                                ),
                              ),
                              prefixIcon: Icon(Icons.key),
                            )
                        )
                    ),

                    SizedBox(height:20,),

                    ElevatedButton(onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("User Login"),
                            content: Text("Login Successfull"),
                            actions: [
                              ElevatedButton(onPressed:(){
                                 UserLogin();
                              }, child: Text("login")),
                              OutlinedButton(onPressed:(){

                                Navigator.pop(context);
                                email.clear();
                                pass.clear();
                              },child: Text("Cancel")),
                            ],
                          );
                        });
                      }

                    }, child: Text("Login")),

              SizedBox(height: 30,),

              Text("Or Sign in with",style: GoogleFonts.poppins(
                  fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),


              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("https://pbs.twimg.com/profile_images/1605297940242669568/q8-vPggS_400x400.jpg"),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffa4a4a4),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(3, 3),
                                )],
                            ),
                          ),
                          SizedBox(width: 20,height: 50,),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("https://www.wizcase.com/wp-content/uploads/2022/05/Facebook-Logo.png"),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffa4a4a4),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(3, 3),
                                )],

                            ),
                          ),
                        ]
                    ),

                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Don't Have an Account ? ",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.black),),
                        /*  ElevatedButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                     }, child:  Text("SignUp",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),)),*/

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen(),));
                          },
                          child:Text("SignUp",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.deepPurple.shade400),),
                        ),
                      ],
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
