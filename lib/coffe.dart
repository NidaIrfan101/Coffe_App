
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class HotBrew extends StatelessWidget {

  // List<Map<String, dynamic>> Data=[
  //   {'names':'Espresso Macchiato',  'price': '5.13' , 'images': 'https://www.nims.it/nims2.xtro.it/repository/1/4/8745/10267/71050/88388/88389/ita-88390.jpg',
  //     'descrip': 'with choclate","with steamed milk","with low fat cold milk","with cinaamon aroma'
  //   },
  //   {'names':'Caffe Mocha',  'price': '7.89', 'images': 'https://imhungryforthat.com/wp-content/uploads/2022/10/cafe-mocha.jpg',
  //     'descrip': 'with choclate","with steamed milk","with low fat cold milk","with cinaamon aroma'},
  //
  //
  // ];
  List names= ["Espresso Macchiato"," Caffe Mocha"];

  List images=["https://www.nims.it/nims2.xtro.it/repository/1/4/8745/10267/71050/88388/88389/ita-88390.jpg",
"https://imhungryforthat.com/wp-content/uploads/2022/10/cafe-mocha.jpg"
  ];



  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          childAspectRatio: 140/200,
          children: List.generate(names.length,(index) => Stack(
            children: [
              Container(
                width: 350,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    border:
                    Border.all(color: Colors.grey.shade400),
                    color: Colors.grey.shade300),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${images[index]}"))),
                  ),

                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Column(
                      children: [
                        Text("${names[index]}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w700),
                        ),



                        Container(decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30)
                        ),
                          margin: EdgeInsets.only(left: 80),
                          child: new IconButton(
                              icon: new Icon(Icons.add,color: Colors.white,),onPressed: null),
                        ),
                      ],
                      crossAxisAlignment:CrossAxisAlignment.start,
                    ),
                  )
                ],
              )
            ],
          )))
    ],
    );
  }
}

class ColdBrew extends StatelessWidget {

  // List<Map<String, dynamic>> Data2=[
  //   {'names':'Shaken Espresso',  'price': '5.13' , 'images': 'https://www.simplyrecipes.com/thmb/t9ZeQC3Nb2YUoQTnxUJrjJbnKEA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Cold-Brew-Coffee-LEAD-16-428691bcdd594281b2f5dc6dbc8235e4.jpg',
  //     'descrip': 'with choclate","with steamed milk","with low fat cold milk","with cinaamon aroma'
  //   },
  //   {'names':'Caramel frappe ',  'price': '7.89', 'images': 'https://minimalistbaker.com/wp-content/uploads/2015/07/EASY-3-ingredient-Caramel-Frappuccino-with-Almond-Milk-Ice-Cubes-Cold-Brew-Coffee-and-Date-Caramel-vegan-glutenfree-coffee-frappuccino-recipe-summer-beverage.jpg',
  //     'descrip': 'with choclate","with steamed milk","with low fat cold milk","with cinaamon aroma'},
  //
  //
  // ];
  List names= ["Shaken Espresso","Caramel frappe"];

  List images=["https://www.simplyrecipes.com/thmb/t9ZeQC3Nb2YUoQTnxUJrjJbnKEA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Cold-Brew-Coffee-LEAD-16-428691bcdd594281b2f5dc6dbc8235e4.jpg"
  ,
  "https://minimalistbaker.com/wp-content/uploads/2015/07/EASY-3-ingredient-Caramel-Frappuccino-with-Almond-Milk-Ice-Cubes-Cold-Brew-Coffee-and-Date-Caramel-vegan-glutenfree-coffee-frappuccino-recipe-summer-beverage.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          childAspectRatio: 140/200,
          children: List.generate(names.length,(index) => Stack(
            children: [
              Container(
                width: 350,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    border:
                    Border.all(color: Colors.grey.shade400),
                    color: Colors.grey.shade300),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${images[index]}"))),
                  ),

                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Column(
                      children: [
                        Text("${names[index]}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w700),
                        ),



                        Container(decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30)
                        ),
                          margin: EdgeInsets.only(left: 80),
                          child: new IconButton(
                              icon: new Icon(Icons.add,color: Colors.white,),onPressed: null),
                        ),
                      ],
                      crossAxisAlignment:CrossAxisAlignment.start,
                    ),
                  )
                ],
              )
            ],
          )))
    ],
    );
  }
}