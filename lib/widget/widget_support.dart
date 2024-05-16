
import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
        color: Color(0xFF2C325D),
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle semiboldTextFieldStyle() {
    return const TextStyle(
        color: Color(0xFF2C325D),
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }

  static TextStyle lightWhiteTextFieldStyle() {
    return const TextStyle(
        color: Color(0xFF2C325D),
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }

  static TextStyle HeadlineTextFieldStyle() {
    return const TextStyle(
        color: Color(0xFF2C325D),
        fontSize: 26.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins');
  }
}