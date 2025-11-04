import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: VacationInfo(), debugShowCheckedModeBanner: false));

class VacationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext c) => Scaffold(
        backgroundColor: const Color(0xFFFFF8E1),
        appBar: AppBar(title: const Text("Vacation Info"), backgroundColor: Colors.teal),
        body: Center(
          child: Card(
            color: Colors.white, elevation: 8, margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(mainAxisSize: MainAxisSize.min, children: const [
                Icon(Icons.beach_access, size: 70, color: Colors.teal),
                SizedBox(height: 10),
                Text("Goa Beach Trip", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("Date: Dec 20 | Duration: 5 Days", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Icon(Icons.flight_takeoff, color: Colors.orange),
                Text("Next: Flight to Goa", style: TextStyle(fontSize: 17, color: Colors.teal)),
              ]),
            ),
          ),
        ),
      );
}
