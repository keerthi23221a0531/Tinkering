import 'package:flutter/material.dart';

void main() => runApp(TravelFeedbackApp());

class TravelFeedbackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Travel Feedback"), backgroundColor: Colors.orangeAccent),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(children: [Icon(Icons.train, color: Colors.orange), SizedBox(width: 10), Text("Journey Type")]),
                  DropdownButtonFormField(
                      items: ["Train", "Bus", "Flight"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (_) {},
                      decoration: InputDecoration(filled: true, fillColor: Colors.orange.shade50)),
                  SizedBox(height: 10),
                  Row(children: [Icon(Icons.star, color: Colors.orange), SizedBox(width: 10), Text("Rating")]),
                  Slider(value: 3, min: 1, max: 5, divisions: 4, onChanged: (_) {}),
                  SizedBox(height: 10),
                  TextField(maxLines: 3, decoration: InputDecoration(labelText: "Comments", filled: true, fillColor: Colors.orange.shade50)),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent, shape: StadiumBorder()))
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
