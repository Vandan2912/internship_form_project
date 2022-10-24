import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_flutter_app_internship/home.dart';
import 'phone.dart';
import 'verify.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        bodyText1: GoogleFonts.poppins(),
        bodyText2: GoogleFonts.poppins(),
        button: GoogleFonts.poppins(),
      ),
    ),
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => Home(),
    },
  ));
}
