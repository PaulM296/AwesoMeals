import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RestaurantsPage(),
  ));
}

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        backgroundColor: Colors.deepOrange,
      ),
      body: RestaurantList(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class RestaurantList extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'BurgerHub',
      'rating': '4.8',
      'logo': 'assets/burgerhub.png'
    },
    {
      'name': 'Jack\'s Bistro',
      'rating': '4.7',
      'logo': 'assets/jacksbistro.png'
    },
    {
      'name': 'Meat Busters',
      'rating': '5',
      'logo': 'assets/meatbusters.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantItem(
          name: restaurants[index]['name'],
          rating: restaurants[index]['rating'],
          logo: restaurants[index]['logo'],
        );
      },
    );
  }
}

class RestaurantItem extends StatelessWidget {
  final String name;
  final String rating;
  final String logo;

  const RestaurantItem({Key? key, required this.name, required this.rating, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(logo, width: 50, height: 50),
          SizedBox(width: 20),
          Expanded(child: Text(name)),
          Text(rating, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}