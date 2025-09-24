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
    return const MaterialApp(
      home: HomePage(),
    );
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

  /// Generates a random RGB color
  void _changeColor() {
    final Random random = Random();
    setState(() {
      backgroundColor = Color.fromARGB(
        255, // fully opaque
        random.nextInt(256), // red
        random.nextInt(256), // green
        random.nextInt(256), // blue
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        body: ColoredBox(
          color: backgroundColor,
          child: const Center(
            child: Text("Hello there"),
          ),
        ),
      ),
    );
  }
}
