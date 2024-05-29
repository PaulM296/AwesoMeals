import 'package:awesomeals/widget/widget_support.dart';
import 'package:flutter/material.dart';
import '../service/database.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<Map<String, dynamic>> restaurants = [];
  final DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  fetchRestaurants() async {
    restaurants = await databaseMethods.getRestaurants();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurants',
              style: AppWidget.HeadlineTextFieldStyle(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            restaurant['imageUrl'],
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13.0),
                            topRight: Radius.circular(13.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant['name'],
                                style: AppWidget.biggerSemiboldTextFieldStyle(),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                restaurant['address'],
                                style: AppWidget.biggerSemiboldTextFieldStyle(),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '${restaurant['rating']} ⭐',
                                style: AppWidget.biggerSemiboldTextFieldStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
