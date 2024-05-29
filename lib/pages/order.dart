import 'package:flutter/material.dart';

import '../service/database.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrdersState();
}

class _OrdersState extends State<Order> {
  List<Map<String, dynamic>> orders = [];
  final DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  fetchOrders() async {
    orders = await databaseMethods
        .getOrders('yourUserId'); // Replace with actual user ID
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Orders',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C325D),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return ListTile(
                    title: Text('Order ID: ${order['id']}'),
                    subtitle: Text('Total: \$${order['totalPrice']}'),
                    trailing: Text(order['status']),
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
