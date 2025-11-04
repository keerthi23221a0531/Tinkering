import 'package:flutter/material.dart';
void main() => runApp(const FoodApp());
class FoodApp extends StatelessWidget {
  const FoodApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Food App", home: const FoodHome());
}
class FoodHome extends StatefulWidget {
  const FoodHome({super.key});
  @override State<FoodHome> createState() => _FoodHomeState();
}
class _FoodHomeState extends State<FoodHome> {
  String? food;
  @override Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text("🍽️ Food Menu"), backgroundColor: Colors.orange),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.fastfood, size: 90, color: Colors.redAccent),
      Text(food ?? "No food selected!", style: const TextStyle(fontSize: 22, color: Colors.deepOrange)),
      const SizedBox(height: 20),
      ElevatedButton.icon(onPressed: ()=>setState(()=>food="🍕 Pizza Selected!"),
        icon: const Icon(Icons.local_pizza), label: const Text("Choose Food"),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green))
    ])));
}
