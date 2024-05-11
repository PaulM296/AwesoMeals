import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Text('9:41', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const Text('Log In', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');  // Navigate to SignUpPage
              },
              child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        leadingWidth: 40,  // Adjust as necessary to fit the design
      ),
      backgroundColor: const Color(0xFF2C325D),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Log In', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey), // Change color of hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: _isObscured,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey), // Change color of hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9900), // Orange color
                foregroundColor: Colors.white, // Ensures all foreground colors are white
                minimumSize: const Size(double.infinity, 50), // full width and 50px height
              ),
              child: const Text(
                'Log In',
                style: TextStyle(color: Colors.white),  // Ensure text color is set to white
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot your password?', style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
