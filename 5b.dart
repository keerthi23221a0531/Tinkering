import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// 🔹 Home screen with navigation to both examples
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Management Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Using setState'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SetStateScreen()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Using Provider'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProviderScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ 1. setState example
class SetStateScreen extends StatefulWidget {
  @override
  _SetStateScreenState createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SetState Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $_count', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _increment, child: Text('Increment')),
                SizedBox(width: 16),
                ElevatedButton(onPressed: _decrement, child: Text('Decrement')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ 2. Provider example
class ProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Provider Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${counter.count}', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: counter.increment, child: Text('Increment')),
                SizedBox(width: 16),
                ElevatedButton(onPressed: counter.decrement, child: Text('Decrement')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ 3. Provider logic
class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
