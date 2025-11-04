import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layouts Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LayoutDemoPage(),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row, Column & Stack Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- ROW EXAMPLE ---
            Text(
              "Row Layout:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.amber[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Modified
                crossAxisAlignment: CrossAxisAlignment.center,   // Modified
                children: [
                  Icon(Icons.home,size:40,color:Colors.red),
                  Icon(Icons.coffee, size: 40, color: Colors.brown),
                  Icon(Icons.emoji_emotions, size: 40, color: Colors.orange),
                ],
              ),
            ),
            SizedBox(height: 20),

            // --- COLUMN EXAMPLE ---
            Text(
              "Column Layout:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.lightBlue[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Modified
                crossAxisAlignment: CrossAxisAlignment.start,      // Modified
                children: [
                   Text("HELLO EVERYONE"),
                   Text("WE ARE FROM BATCH 1"),
                   Text("505,508,531,536")
                ],
              ),
            ),
            SizedBox(height: 20),

            // --- STACK EXAMPLE ---
            Text(
              "Stack Layout:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: Stack(
                children: [
                  Container(width: 150, height: 150, color: Colors.brown),
                  Positioned(
                    left: 50,
                    top: 30,
                    child: Container(width: 100, height: 100, color: Colors.yellow),
                  ),
                  Positioned( // Modified - Centered Cake Icon
                    left:80,
                    top:60,
                    child: Icon(Icons.cake, size: 40, color: Colors.purple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
