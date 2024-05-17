import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/widget_support.dart';
import 'details.dart';

const Color primaryColor = Color(0xFFFF9900);  // Orange
const Color lightBackground = Color(0xFFFFF3E0);  // Light orange for background
const Color accentColor = Color(0xFFF57C00);  // Darker orange for accents
const Color whiteColor = Colors.white;  // White for text and icons
const Color blueColor = Color(0xFF2C325D);


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool pizza = false;
  bool burger = false;
  bool salad = false;
  bool dessert = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu",
                      style: AppWidget.boldTextFieldStyle()
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.shopping_cart, color: primaryColor),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("Delicious Food",
                  style: AppWidget.HeadlineTextFieldStyle()
              ),
              SizedBox(
                  height: 20.0
              ),
              ShowItem(),
              SizedBox(height: 30.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("images/Pizza2.png", height: 150, width: 150, fit: BoxFit.cover),
                                Text("Salami Pizza",
                                    style: AppWidget.semiboldTextFieldStyle()),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text("Tasty And Delicious",
                                    style: AppWidget.lightWhiteTextFieldStyle()),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text("\45.99Ron",
                                    style: AppWidget.lightWhiteTextFieldStyle())
                              ],),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/Burger2.png", height: 150, width: 150, fit: BoxFit.cover),
                              Text("Salami Pizza",
                                  style: AppWidget.semiboldTextFieldStyle()),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text("Tasty And Delicious",
                                  style: AppWidget.lightWhiteTextFieldStyle()),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text("\41.99Ron",
                                  style: AppWidget.lightWhiteTextFieldStyle())
                            ],),
                        ),
                      ),
                    )
                  ],),
              ),

              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/Pizza2.png", height: 120, width: 120, fit: BoxFit.cover),
                        SizedBox(width: 20.0),
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Pepperoni Pizza", style: AppWidget.semiboldTextFieldStyle())
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("A very tasty and delicious pizza", style: AppWidget.lightWhiteTextFieldStyle())
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("42.99Ron", style: AppWidget.lightWhiteTextFieldStyle()),
                          ),
                        ],)
                      ],),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/Pizza2.png", height: 120, width: 120, fit: BoxFit.cover),
                        SizedBox(width: 20.0),
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Pepperoni Pizza", style: AppWidget.semiboldTextFieldStyle())
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("A very tasty and delicious pizza", style: AppWidget.lightWhiteTextFieldStyle())
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("42.99Ron", style: AppWidget.lightWhiteTextFieldStyle()),
                          ),
                        ],)
                      ],),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ShowItem() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              pizza = true;
              burger = false;
              salad = false;
              dessert = false;
              setState(() {

              });
            },
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: pizza ? blueColor: whiteColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/pizza.png", height: 50, width: 50, fit: BoxFit.cover),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              pizza = false;
              burger = true;
              salad = false;
              dessert = false;
              setState(() {

              });
            },
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: burger ? blueColor: whiteColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/burger.png", height: 50, width: 50, fit: BoxFit.cover),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              pizza = false;
              burger = false;
              salad = true;
              dessert = false;
              setState(() {

              });
            },
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: salad ? blueColor: whiteColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/salad.png", height: 50, width: 50, fit: BoxFit.cover),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              pizza = false;
              burger = false;
              salad = false;
              dessert = true;
              setState(() {

              });
            },
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: dessert ? blueColor: whiteColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/dessert.png", height: 50, width: 50, fit: BoxFit.cover),
              ),
            ),
          ),
        ]);
  }
}