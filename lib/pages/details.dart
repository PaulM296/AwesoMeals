import 'package:flutter/material.dart';
import '../widget/widget_support.dart';

class Details extends StatefulWidget {
  final dynamic dish;

  Details({required this.dish, super.key});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xFF2C325D),
              ),
            ),
            Image.network(
              widget.dish['imageUrl'],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.dish['name'],
                        style: AppWidget.HeadlineTextFieldStyle()),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2C325D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.remove, color: Color(0xFFFF9900)),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(quantity.toString(),
                    style: AppWidget.semiboldTextFieldStyle()),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2C325D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add, color: Color(0xFFFF9900)),
                  ),
                ),
              ],
            ),
            Text("Description",
                style: AppWidget.biggerSemiboldTextFieldStyle()),
            SizedBox(height: 20,),
            Text(widget.dish['description'], style: TextStyle(fontSize: 20)),
            SizedBox(height: 30.0),
            Row(
              children: [
                Text("Delivery Time",
                    style: AppWidget.biggerSemiboldTextFieldStyle()),
                SizedBox(width: 35.0),
                Icon(Icons.alarm, color: Color(0xFF2C325D)),
                SizedBox(width: 5.0),
                Text("30-40 min",
                    style: AppWidget.biggerSemiboldTextFieldStyle()),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",
                          style: AppWidget.biggerSemiboldTextFieldStyle()),
                      Text(
                          "${(widget.dish['price'] * quantity).toStringAsFixed(2)} Ron",
                          style: AppWidget.HeadlineTextFieldStyle()),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C325D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(width: 30.0),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Color(0xFF2C325D),
                          ),
                          child: Icon(Icons.shopping_cart_outlined,
                              color: Color(0xFFFF9900)),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
