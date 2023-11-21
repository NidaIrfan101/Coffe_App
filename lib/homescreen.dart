import 'package:coffeshop_app/description%20screen.dart';
import 'package:coffeshop_app/loginscreen.dart';
import 'package:coffeshop_app/register_screen.dart';
import 'package:coffeshop_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coffe.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<Widget>myScreens=[HomeScreen(),LoginScreen(),RegisterScreen(),SplashScreen()];
List icon=[Icon(Icons.coffee)];

  List categories=["ColdBrew","HotBrew"];

  int currentIndex = 0;





  List Recomended_images=["https://www.nims.it/nims2.xtro.it/repository/1/4/8745/10267/71050/88388/88389/ita-88390.jpg",
    "https://imhungryforthat.com/wp-content/uploads/2022/10/cafe-mocha.jpg",
     "https://copykat.com/wp-content/uploads/2021/08/Starbucks-Vanilla-Sweet-Cream-Cold-Brew-Pin-1-1024x1536.jpg",
    "https://delightfulemade.com/wp-content/uploads/2023/09/Cinnamon-dolce-latte-recipe-6-720x720.jpg"];


   List Recomended_names =["Espresso Macchiato","Caffe Mocha","Vanilla Shaken Brew","Cinnamon Dolce Latte"];


  List Recomended_descrip =["with choclate","with steamed milk","with low fat cold milk","with cinaamon aroma"];
   List Recomended_price =["5.13","7.89","4.00","6.50"];


  List offer_images = ["https://pbs.twimg.com/media/E107WqpXIAILcFP.jpg",
  "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipemediafiles/recipes/retail/x17/17000-cappuccino-chocolate-chip-cookies-600x600.jpg?ext=.jpg",
  "https://images.pexels.com/photos/11574240/pexels-photo-11574240.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/6259278/pexels-photo-6259278.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/17558645/pexels-photo-17558645/free-photo-of-sweet-shakes-in-glasses.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"];

  List offer_description = ["Two Cappuccino In Price Of One!!",
  "3 Choclate chip Cookie With Cappuccino",
  "Hot Brew With a free choclate Eclair",
  "One Hot Choclate With Ginger Cookie",
  "3 Frappe of your Own choice In Price of 2"];

List<Widget> screens= [
  HotBrew(),
  ColdBrew()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [

            //TOP BAR//
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.lime,
                  backgroundImage: NetworkImage(""),
                ),

                SizedBox(width: 90), // give it width

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Coffee_Bean_%26_Tea_Leaf_logo.svg/150px-Coffee_Bean_%26_Tea_Leaf_logo.svg.png"),
                ),

                SizedBox(width: 70), //// give it width


                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child: new IconButton(
                      icon: new Icon(Icons.add_alert_outlined,color: Colors.black,size: 35.0),onPressed: null),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Text("Good Morning", style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            )),

            //DIVIDER//
            Container(
              width: 50,
              margin: EdgeInsets.only(right: 70),
              child: Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),


            SizedBox(height: 20,),

            //SEARCH BAR///
            Container(
              width:double.infinity,

              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 260,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 5),
                            hintText: "Search.....",
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 70,),
                  Icon(Icons.search,color:Colors.white,size: 40.0,)

                ],
              ),
            ),


            SizedBox(height: 20,),

            //HEADING//
            Container(
              margin:EdgeInsets.only(right: 200),
              child: Column(
                children: [
                  Text("Categoriess", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  )),
                ],
              ),
            ),


            //FILTER BUUTTONSS//


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ListView.builder(
                      itemCount: categories.length  ,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInCubic,
                            width: 80,
                            height: 30,
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                border: currentIndex == index?Border.all(color: Colors.deepPurple):Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(14)
                            ),
                              child:Row(
                                children: [
                                  Text(categories[index],style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize: 15),),
                                ],
                              ),


                          ),
                        );
                      },),
                  ),

                ),
              ],
            ),
         SizedBox(height: 8,),



             //Filter boxes//


            SizedBox(height: 10,),

            screens[currentIndex],



//heading//
            Container(
              margin:EdgeInsets.only(right: 180),
              child: Column(
                children: [
                  Text("Recommended", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  )),
                ],
              ),
            ),

            SizedBox(height: 5,),

            //RECOMENDATIONS//

            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  childAspectRatio: 140/300,
                  children: List.generate(Recomended_images.length, (index) => Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade400),
                            color:Colors.grey.shade300),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lime,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("${Recomended_images[index]}"))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            margin: EdgeInsets.only(left: 14),
                            child:Column(
                              children: [
                                Text("${Recomended_names[index]}",style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                ),),
                                Text("${Recomended_descrip[index]}",style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),),

                                Text("${Recomended_price[index]}",style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800
                                ),),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(image:Recomended_images[index], name: Recomended_names[index], smalldescription: Recomended_descrip[index],price:Recomended_price[index])));
                                  },
                                  child: Container(

                                    padding: EdgeInsets.only(),
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    margin: EdgeInsets.only(left: 90,bottom: 40),
                                    child: new IconButton(
                                        icon: new Icon(Icons.add,color: Colors.white,),onPressed: null),
                                  ),
                                ),

                              ],

                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                )
              ],
            ),

            SizedBox(height: 10,),



            //HEADING//
            Container(
              margin:EdgeInsets.only(right: 190),
              child: Column(
                children: [
                  Text("Special Offers!", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  )),
                ],
              ),
            ),

            //Special offer//
            Column(children:

            List.generate(
                offer_images.length,
                    (index) => Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 600,
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(20),
                            border:
                            Border.all(color: Colors.grey.shade400),
                            color: Colors.grey.shade300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${offer_images[index]}"))),
                            ),

                            SizedBox(
                              width: 3,
                            ),

                            SizedBox(
                              width: 160,
                              child: Text(
                                "${offer_description[index]}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w400),
                                overflow: TextOverflow.fade,),
                            ),


                            IconButton(
                                icon: Icon(Icons.keyboard_double_arrow_right,color: Colors.deepPurple,size:18.0),onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(image:offer_images[index], name: offer_description[index], smalldescription: Recomended_descrip[index],price:Recomended_price[index])));

                            }),

                          ],
                        ),
                      ),

                    ]
                )
            )


            )


          ],
        ),
      ),

    );
  }
}


