import 'package:flutter/material.dart';

void main() => runApp(StudyApp());

class StudyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Info App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: StudyHome(),
    );
  }
}

class StudyHome extends StatelessWidget {
  final List<Map<String, String>> subjects = [
    {'name': 'Mathematics', 'image': 'https://i.imgur.com/9Jj4xWf.png', 'info': 'Math improves problem-solving skills.'},
    {'name': 'Science', 'image': 'https://i.imgur.com/hkV0T7S.png', 'info': 'Science helps us understand the world.'},
    {'name': 'History', 'image': 'https://i.imgur.com/x1h7yLT.png', 'info': 'History teaches lessons from the past.'},
    {'name': 'English', 'image': 'https://i.imgur.com/VuwJ8bU.png', 'info': 'English improves communication skills.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Subjects')),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Image.network(subjects[i]['image']!, width: 50),
              title: Text(subjects[i]['name']!, style: Theme.of(context).textTheme.headlineLarge),
              subtitle: Text(subjects[i]['info']!, style: Theme.of(context).textTheme.bodyMedium),
              onTap: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(subjects[i]['name']!),
                  content: Text(subjects[i]['info']!),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
