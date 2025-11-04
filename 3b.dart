import 'package:flutter/material.dart';

void main() => runApp(CreativeResponsiveApp());

class CreativeResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHome(),
    );
  }
}

class ResponsiveHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String deviceType;
    Color bgColor;
    IconData icon;

    if (screenWidth < 600) {
      deviceType = "📱 Mobile View";
      bgColor = Colors.pinkAccent.shade100;
      icon = Icons.phone_android;
    } else if (screenWidth < 1000) {
      deviceType = "💻 Tablet View";
      bgColor = Colors.amber.shade200;
      icon = Icons.tablet_mac;
    } else {
      deviceType = "🖥️ Desktop View";
      bgColor = Colors.lightGreen.shade300;
      icon = Icons.desktop_windows;
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Creative Responsive UI"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 70, color: Colors.deepPurple),
              SizedBox(height: 20),
              Text(
                deviceType,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Screen width: ${screenWidth.toStringAsFixed(0)} px",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
