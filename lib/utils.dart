import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:driveclone/controllers/authentication_controller.dart';

TextStyle textStyle(double fontSize, Color color, FontWeight fw) {
  return GoogleFonts.montserrat(
    fontSize: fontSize, // Corrected the typo here
    color: color,
    fontWeight: fw,
  ); // Removed the extra closing parenthesis
}
Color textColor = const Color(0xffA69CB7);

CollectionReference<Map<String,dynamic>>userCollection=FirebaseFirestore.instance.collection('users');