import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = []; // You should manage this list

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Color(0xFF2C325D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                    trailing: Text('\$${item['price']}'),
                  );
                },
              ),
            ),
            Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Proceed to checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF9900),
              ),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
