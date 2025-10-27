import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  static  const TextStyle heading=TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static  const TextStyle subHeading=TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static  TextStyle poppinsW50018s=GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.white,

  );
  static  const TextStyle button=TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static  TextStyle Poppins600w24s=GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.white,

  );
  static  TextStyle Poppins300w16s=GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: Colors.white,

  );
}