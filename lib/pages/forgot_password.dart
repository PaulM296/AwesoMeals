import 'package:awesomeals/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = new TextEditingController();

  String email = "";

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Password reset email has been sent!",
                  style: TextStyle(fontSize: 18.0))));
    } on FirebaseAuthException catch (e) {
      if(e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("No user was found for the specified email!",
                  style: TextStyle(fontSize: 18.0),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C325D),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70.0),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(color: Color(0xFFFF9900),
                fontSize: 30.0,
                fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 100.0,),
            Text("Enter your email",
            style: TextStyle(
              color: Color(0xFFFF9900),
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),
            Expanded(
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
            child:ListView(children: [
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFF9900), width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color(0xFFFF9900)),
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 18.0, color: Color(0xFFFF9900)),
                      prefixIcon: Icon(Icons.person,
                          color: Color(0xFFFF9900),
                          size: 30.0),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () {
                        if(_formkey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                          });
                          resetPassword();
                        }
                      },
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9900),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Send email",
                            style: TextStyle(color: Color(0xFF2C325D),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(fontSize: 18.0, color: Color(0xFFFF9900))),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(" Create a new account", style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )
                    ),
                  ),
                ],
              ),
                  ],
                ),
              ),
            )
          ),
          ],
        ),
      )
    );
  }
}
