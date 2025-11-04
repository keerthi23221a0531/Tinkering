import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Widgets Example')),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.lightBlue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Flutter!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.amber,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'This is a Container Widget',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Flutter makes UI easy and fast!',
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
