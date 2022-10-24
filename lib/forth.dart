import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForthScreen extends StatefulWidget {
  const ForthScreen({Key? key}) : super(key: key);

  @override
  State<ForthScreen> createState() => _ForthScreenState();
}

class _ForthScreenState extends State<ForthScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyText1: GoogleFonts.poppins(),
          bodyText2: GoogleFonts.poppins(),
          button: GoogleFonts.poppins(),
        ),
      ),
      home: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text("Further pages are not ready.")],
        ),
      ),
    );
  }
}
