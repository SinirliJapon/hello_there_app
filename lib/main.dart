import 'dart:math';
import 'package:flutter/material.dart';

/// The entry point of the app
void main() {
  runApp(const MyApp());
}

/// The root widget of the application
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

/// The home page of the app displaying text and handling taps.
class HomePage extends StatefulWidget {
  /// Creates a [HomePage] widget.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// The state of [HomePage] which handles background color changes.
class _HomePageState extends State<HomePage> {
  /// The current background color.
  Color backgroundColor = Colors.white;

  /// The current red, green, and blue color codes.
  int redCode = 255;
  int greenCode = 255;
  int blueCode = 255;

  /// Generates a random RGB color and updates the background.
  void _changeColor() {
    final Random random = Random();

    // Generate new RGB values
    redCode = random.nextInt(256);
    greenCode = random.nextInt(256);
    blueCode = random.nextInt(256);

    setState(() {
      // Update background color
      backgroundColor = Color.fromARGB(255, redCode, greenCode, blueCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        /// AppBar that displays current RGB values
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'RGB: $redCode,$greenCode,$blueCode',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        /// Body with smooth animated background and rounded text background
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          color: backgroundColor,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5), // transparency
                borderRadius: BorderRadius.circular(30), // rounded corners
              ),
              child: const Text(
                "Hello there",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
