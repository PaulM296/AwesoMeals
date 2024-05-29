import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Welcome to Awesomeals!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C325D),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C325D),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Awesomeals is your go-to app for discovering amazing restaurants around you. '
                  'Whether you are craving a quick bite or looking for a fine dining experience, we have got you covered. '
                  'Explore our extensive list of restaurants, read reviews, and easily place orders.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How It Works',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:Color(0xFF2C325D),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Browse through our list of curated restaurants.\n'
                  '2. Read detailed reviews and see ratings from other food enthusiasts.\n'
                  '3. Make reservations directly from the app.\n'
                  '4. Enjoy your meal and share your experience with the community.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C325D),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or feedback, feel free to reach out to us at contact@awesomeals.com. '
                  'We are always here to help and would love to hear from you.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
