// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart'; // <-- IMPORT GOOGLE FONTS


// --- DEFINE OUR NEW COLORS ---
const Color kPrimaryColor = Color(0xFF0D47A1); // A deep, premium blue
const Color kAccentColor = Color(0xFFFFD700); // Soft Gold
const Color kScaffoldBackground = Color(0xFFF8F8F8); // A very light grey
// ---


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the base text theme using Google Fonts
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    return MaterialApp(
      title: 'Hall Booking App',
      theme: ThemeData(
        // --- 1. COLOR SCHEME ---
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldBackground,
        colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kAccentColor,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
        ),
        
        // --- 2. FONT / TEXT THEME ---
        textTheme: textTheme.copyWith(
          // Example: Customizing display text
          displayLarge: textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
          headlineSmall: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          // Set body color to a softer black
          bodyMedium: textTheme.bodyMedium?.copyWith(color: Colors.black87, fontSize: 15),
        ),

        // --- 3. GLOBAL WIDGET THEMES ---

        // -- AppBar Theme --
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Clean white app bars
          elevation: 1, // Subtle shadow
          iconTheme: const IconThemeData(color: kPrimaryColor), // Blue icons
          titleTextStyle: textTheme.headlineSmall?.copyWith(
            color: kPrimaryColor, // Blue title
            fontSize: 20,
          ),
        ),

        // -- Button Theme --
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, // Blue buttons
            foregroundColor: Colors.white, // White text
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            textStyle: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
        
        // -- Outlined Button Theme --
         outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: kPrimaryColor,
            side: const BorderSide(color: kPrimaryColor, width: 1.5),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
             textStyle: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),

        // -- TextField Theme --
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          prefixIconColor: Colors.grey.shade600,
        ),
        
        // -- Card Theme --
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.grey.shade100,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        
        // -- Bottom Navigation Bar Theme --
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey.shade600,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: textTheme.bodySmall,
        ),
        
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}