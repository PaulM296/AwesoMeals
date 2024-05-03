import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Menu",
//                 style: AppWidget.boldTextFieldStyle()
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(3),
//                   decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
//                   child: Icon(Icons.shopping_cart, color: Colors.white,),
//                 )
//               ],
//             ),
//             SizedBox(height: 30.0,),
//             Text("Delicious Food",
//                 style: AppWidget.boldTextFieldStyle()
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(const MaterialApp(home: MenuPage()));
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _searchBar(),
            _categorySelector(),
            _promotionCard(),
            _popularDishes(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _categorySelector() {
    // This can be further improved with a ListView.builder for dynamic content
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: ['All', 'Pizza', 'Chicken Shawarma'].map((category) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(category),
          );
        }).toList(),
      ),
    );
  }

  Widget _promotionCard() {
    return const Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text('50% on Cup of Ice Cream'),
          subtitle: Text('for all orders above 40 RON'),
          trailing: Icon(Icons.local_offer),
        ),
      ),
    );
  }

  Widget _popularDishes() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(4, (index) {
        return GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text('Dish $index'),
          ),
          child: Image.network('https://via.placeholder.com/150'),
        );
      }),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      type: BottomNavigationBarType.fixed,
    );
  }
}
