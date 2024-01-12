import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_organizer/screens/home_screen.dart';

void main() {
  runApp(const PartyApp());
}

class PartyApp extends StatelessWidget {
  const PartyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
