import 'package:clubhome/config/palette.dart';
import 'package:clubhome/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClubHouse UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
        scaffoldBackgroundColor: Palette.background,
        accentColor: Palette.green,
        primaryColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black), 
        fontFamily: GoogleFonts.montserrat().fontFamily, 
        textTheme: GoogleFonts.montserratTextTheme()
      ),
      home: HomeScreen(),
    );
  }
}
