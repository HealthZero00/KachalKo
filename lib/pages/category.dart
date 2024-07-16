import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:KachalKo/pages/bizeps.dart';
import 'package:KachalKo/pages/grud.dart';
import 'package:KachalKo/pages/nogi.dart';
import 'package:KachalKo/pages/plechi.dart';
import 'package:KachalKo/pages/predpleshya.dart';
import 'package:KachalKo/pages/press.dart';
import 'package:KachalKo/pages/spina.dart';
import 'package:KachalKo/pages/trizeps.dart';
class Category extends StatefulWidget{
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double itemHeight = screenHeight * 0.25;
    double itemWidth = screenWidth * 0.45;



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff006363),
        appBar: AppBar(
          backgroundColor: Color(0xff1D7373),
          title: Text(
            "KachalKo",
            style: TextStyle(fontSize: 24, color: Color(0xffFFAA00)),
          ),
          centerTitle: true,
        ),

        body:  SingleChildScrollView(
          padding: EdgeInsets.only(top: 15, bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                      children: [
                        Center(
                          child: Text("Плечи", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Plechi()));
                          },
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/plechi.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Spacer(),
                  Column(
                      children: [
                        Center(
                          child: Text("Спина", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Spina()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(-3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/spina.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),

                ],
              ),

              Row(
                children: [
                  Column(
                      children: [
                        Center(
                          child: Text("Грудь", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Grud()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/grudi.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Spacer(),
                  Column(
                      children: [
                        Center(
                          child: Text("Бицепс", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Bizeps()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(-3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/bizeps.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),

                ],
              ),
              Row(
                children: [
                  Column(
                      children: [
                        Center(
                          child: Text("Трицепс", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Trizeps()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/trizeps.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Spacer(),
                  Column(
                      children: [
                        Center(
                          child: Text("Предплечья", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Predpleshya()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(-3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/predplechiya.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),

                ],
              ),
              Row(
                children: [
                  Column(
                      children: [
                        Center(
                          child: Text("Пресс", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Press()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/press.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Spacer(),
                  Column(
                      children: [
                        Center(
                          child: Text("Ноги", style: TextStyle(color: Color(0xffFFAA00), fontSize: 24),),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Nogi()));
                          }, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: itemHeight,
                            width: itemWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(-3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/nogi.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),

                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}