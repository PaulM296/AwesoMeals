import 'package:awesomeals/pages/bottomnav.dart';
import 'package:awesomeals/pages/forgot_password.dart';
import 'package:awesomeals/pages/signup.dart';
import 'package:awesomeals/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../service/shared_pref.dart';
import '../widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  userLogin() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      Map<String, dynamic> user = await DatabaseMethods().getUser(email);

      await SharedPreferenceHelper().saveUserName(user['Name']);
      await SharedPreferenceHelper().saveUserEmail(user['Email']);
      await SharedPreferenceHelper().saveUserWallet(user['Wallet']);
      await SharedPreferenceHelper().saveUserId(user['Id']);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
    } on FirebaseAuthException catch(e) {
      if(e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
            "No user found for the specified Email",
            style: TextStyle(fontSize: 18.0, color: Color(0xFF2C325D)))));
      } else if(e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
            "The password is not correct",
            style: TextStyle(fontSize: 18.0, color: Color(0xFF2C325D)))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      Color(0xFFFF9900),
                      Color(0xFFFF9900),
                      ])),
            ),
            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                        "images/Logo.png",
                        width: MediaQuery.of(context).size.width / 4.2,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "Login",
                              style: AppWidget.HeadlineTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: useremailController,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return 'Please enter the email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiboldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return 'Please enter the password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiboldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.password_outlined)),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                              },
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: AppWidget.semiboldTextFieldStyle(),
                                  )),
                            ),
                            SizedBox(
                              height: 80.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = useremailController.text;
                                    password = passwordController.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(color: Color(0xFFFF9900), borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins1',
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 140.0,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                      child: Text("Don't have an account? Sign up", style: AppWidget.semiboldTextFieldStyle(),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
