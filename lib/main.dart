import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_organizer/firebase_options.dart';
import 'package:party_organizer/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const PartyApp());
}

class PartyApp extends StatelessWidget {
  const PartyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 227, 227, 227),
          background: const Color.fromARGB(255, 227, 227, 227),
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
