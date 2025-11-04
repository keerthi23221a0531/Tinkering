import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));

class HomePage extends StatelessWidget {
  final data = {'name': 'Bujji', 'email': 'bujji@gmail.com', 'city': 'Devaguptam'};
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text('Parent Info App'), backgroundColor: Colors.blue),
    body: Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () => Navigator.push(c, MaterialPageRoute(
          builder: (_) => InfoPage(data: data))),
        child: Text('Parent Info', style: TextStyle(fontSize: 20)),
      ),
    ),
  );
}

class InfoPage extends StatelessWidget {
  final Map data;
  InfoPage({required this.data});
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text('Parent Details'), backgroundColor: Colors.blue),
    body: Center(child: Text(
      'Name: ${data['name']}\nEmail: ${data['email']}\nCity: ${data['city']}',
      style: TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center)),
  );
}
