import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHome(),
    );
  }
}

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // Decide layout based on screen width
          if (width < 600) {
            // 📱 Phone layout
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "PHONE LAYOUT",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: const [
                      BlockWidget(name: "505", color: Colors.blue),
                      BlockWidget(name: "508", color: Colors.green),
                      BlockWidget(name: "531", color: Colors.orange),
                      BlockWidget(name: "536", color: Colors.red),
                    ],
                  ),
                ),
              ],
            );
          } else if (width < 1100) {
            // 📊 Tablet layout
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "TABLET LAYOUT",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: const [
                      BlockWidget(name: "505", color: Colors.blue),
                      BlockWidget(name: "508", color: Colors.green),
                      BlockWidget(name: "531", color: Colors.orange),
                      BlockWidget(name: "536", color: Colors.red),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // 🖥 Desktop layout
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "DESKTOP LAYOUT",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: const [
                      BlockWidget(name: "505", color: Colors.blue),
                      BlockWidget(name: "508", color: Colors.green),
                      BlockWidget(name: "531", color: Colors.orange),
                      BlockWidget(name: "536", color: Colors.red),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class BlockWidget extends StatelessWidget {
  final String name;
  final Color color;

  const BlockWidget({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold, // ✅ Bold text
          ),
        ),
      ),
    );
  }
}
