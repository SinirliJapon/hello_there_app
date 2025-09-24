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

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Colors.white;
  int redCode = 255;
  int greenCode = 255;
  int blueCode = 255;

  /// Generates a random RGB color
  void _changeColor() {
    final Random random = Random();

    /// Generate new RGB values
    redCode = random.nextInt(256);
    greenCode = random.nextInt(256);
    blueCode = random.nextInt(256);

    setState(() {
      /// Update background color with the same RGB values
      backgroundColor = Color.fromARGB(
        255, // fully opaque
        redCode, // red
        greenCode, // green
        blueCode, // blue
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
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
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          color: backgroundColor,
          child: const Center(
            child: Text(
              "Hello there",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
