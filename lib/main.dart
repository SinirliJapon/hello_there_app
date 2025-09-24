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
class HomePage extends StatelessWidget {
  /// Creates a [HomePage] widget.
  const HomePage({super.key});

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () {
        /// Color changing logic here, will be added later on
      } ,
      child: const Scaffold(
        body: Center(
          child: Text("Hello there"),
        ),
      ),
    );
  }
}
