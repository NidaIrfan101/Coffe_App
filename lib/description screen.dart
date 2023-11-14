import 'package:coffeshop_app/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'homescreen.dart';
class DescriptionScreen extends StatefulWidget {


  String image;
  String name;
  String smalldescription;

  DescriptionScreen({required this.image, required this.name, required this.smalldescription });



  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}
List sizes=["Small","Medium","Large"];




int currentIndex=0;
class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body:
      SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [

        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover
              )
          ),
        ),
            SizedBox(height: 5,),
            Column(
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 1),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)
                      )
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Icon(Icons.star, color: Colors.white,size: 15.0),
                            padding: EdgeInsets.only(right:35.0),
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Colors.brown.shade600,
                                borderRadius: BorderRadius.circular(40)
                            ),
                          ),
                          Text("4.5")
                        ],
                      ),
                      SizedBox(height: 10,),


                      Text(widget.name,style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 8,),
                      Text(widget.smalldescription,style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),),

                      SizedBox(height: 8,),
                      Text("Sizes",style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: SizedBox(

                              width: double.infinity,
                              height: 40,
                              child: ListView.builder(
                                itemCount: sizes.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        currentIndex=index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.bounceInOut,
                                        width: 90,
                                        height: 30,

                                        margin: EdgeInsets.symmetric(horizontal: 6),
                                        decoration:BoxDecoration(

                                            color: Colors.deepPurple.shade500,
                                            border: currentIndex==index?Border.all(color: Colors.purpleAccent):Border.all(color: Colors.deepPurple.shade900),
                                            borderRadius: BorderRadius.circular(16)
                                        ),
                                        child:Row(
                                          children: [
                                            SizedBox(width: 5,),
                                            Text(sizes[index],style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),),
                                          ],
                                        )
                                    ),
                                  );
                                },
                              ),
                            ),

                          ),

                        ],
                      ),

                      SizedBox(height: 8,),
                      Text("About",style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 6,),
                      Text("about",style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),),

                    ],

                  ),

                )
              ],
            ),







          ],
        ),
      ),


    );
  }
}