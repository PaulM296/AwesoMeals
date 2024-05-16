// import 'package:flutter/material.dart';
//
// const Color primaryColor = Color(0xFFFF9900);  // Orange
// const Color lightBackground = Color(0xFFFFF3E0);  // Light orange for background
// const Color accentColor = Color(0xFFF57C00);  // Darker orange for accents
// const Color whiteColor = Colors.white;  // White for text and icons
// const Color blueColor = Color(0xFF2C325D);
// void main() {
//   runApp(const MaterialApp(home: MenuPage()));
// }
//
// class MenuPage extends StatelessWidget {
//   const MenuPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         foregroundColor: primaryColor,
//         title: const Text('Menu', style: TextStyle(color: whiteColor)),
//         actions: [],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _searchBar(),
//             _categorySelector(),
//             _promotionCard(),
//             _popularDishes(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _bottomNavigationBar(),
//     );
//   }
//
//   Widget _searchBar() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         style: TextStyle(color: blueColor),
//         decoration: InputDecoration(
//           hintText: 'Search',
//           prefixIcon: const Icon(Icons.search, color: Colors.grey),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide.none, // Ensures no border is visible
//           ),
//           filled: true,
//           fillColor: whiteColor, // Ensure this matches your design
//         ),
//       ),
//     );
//   }
//
//   Widget _categorySelector() {
//     return Container(
//       color: primaryColor, // Set the background color for the category selector
//       height: 50,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: ['All', 'Pizza', 'Chicken Shawarma'].map((category) {
//           return Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(category, style: TextStyle(color: blueColor)),
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _promotionCard() {
//     return Card(
//       color: lightBackground,
//       margin: const EdgeInsets.all(8),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           title: const Text('50% on Cup of Ice Cream', style: TextStyle(color: blueColor)),
//           subtitle: const Text('for all orders above 40 RON', style: TextStyle(color: blueColor)),
//           trailing: const Icon(Icons.local_offer, color: accentColor),
//         ),
//       ),
//     );
//   }
//
//   Widget _popularDishes() {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       children: List.generate(4, (index) {
//         return Container( // Wrap in a Container to control color
//           color: blueColor, // Set the background color for each dish tile
//           child: GridTile(
//             footer: GridTileBar(
//               backgroundColor: Colors.transparent, // Clear or use a specific color
//               title: Text('Dish $index', style: TextStyle(color: primaryColor)),
//             ),
//             child: Image.network('https://via.placeholder.com/150'),
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _bottomNavigationBar() {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.menu),
//           label: 'Menu',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart),
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_circle),
//           label: 'Profile',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.info),
//           label: 'Info',
//         ),
//       ],
//       selectedItemColor: accentColor,
//       unselectedItemColor: whiteColor,
//       backgroundColor: primaryColor,
//       type: BottomNavigationBarType.fixed,
//       // Add here the current index management if necessary
//     );
//   }
// }
