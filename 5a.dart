import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(StatelessStatefulDemo());
}

class StatelessStatefulDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateless vs Stateful",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless & Stateful Example"),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stateless widget
              FixedImageCard(),

              SizedBox(height: 30),

              // Stateful widget
              ColorChanger(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Stateless widget -> fixed, doesn’t change
class FixedImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
            SizedBox(height: 10),
            Text(
              "I am a Stateless Widget 🖼️",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stateful widget -> background changes on button press
class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color bgColor = Colors.grey.shade200;
  final Random _random = Random();

  void _changeColor() {
    setState(() {
      bgColor = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "I am Stateful 🎨",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: _changeColor,
            child: Text("Change Background Color"),
          ),
        ],
      ),
    );
  }
}
