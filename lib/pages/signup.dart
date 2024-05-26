import 'package:awesomeals/pages/bottomnav.dart';
import 'package:awesomeals/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String email = "", password = "", name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if(password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Color(0xFFFF9900),
          content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),),)));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
      } on FirebaseException catch (e) {
        if(e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Color(0xFFFF9900),
              content: Text(
            "The provided password is too weak!",
            style: TextStyle(fontSize: 18.0),)));
        }
        else if(e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Color(0xFFFF9900),
              content: Text(
            "Account already exists!",
            style: TextStyle(fontSize: 18.0),)));
        }
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
                      height: MediaQuery.of(context).size.height / 1.8,
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
                              "Sign up",
                              style: AppWidget.HeadlineTextFieldStyle(),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return 'Please enter your name!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidget.semiboldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.person_outlined)),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if(value == null || value.isEmpty) {
                                  return 'Please enter your email!';
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
                                  return 'Please enter your password!';
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
                              height: 80.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if(_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                    name = nameController.text;
                                    password = passwordController.text;
                                  });
                                }
                                registration();
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
                                        "SIGN UP",
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
                  SizedBox(height: 70.0,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                      },
                      child: Text("Already have an account? Login", style: AppWidget.semiboldTextFieldStyle(),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}