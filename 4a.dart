import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

// ---------------- First Screen ----------------
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Column with Icons",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Column of icons
            Column(
              children: const [
                Icon(Icons.cake, size: 50, color: Colors.pink),
                SizedBox(height: 10),
                Icon(Icons.apple, size: 50, color: Colors.red),
                SizedBox(height: 10),
                Icon(Icons.home, size: 50, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()),
                );
              },
              child: const Text("Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Second Screen ----------------
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Row with Circles & Names",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Row of circles with names
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.orange,
                  child: Text("Keerthi",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal,
                  child: Text("Sindhu",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.pink,
                  child: Text("Pradeepa",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context); // Back to first screen
              },
              child: const Text("Back to First Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
