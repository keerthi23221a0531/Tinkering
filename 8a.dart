import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: GrowingSmileys(),
      debugShowCheckedModeBanner: false,
    ));

class GrowingSmileys extends StatefulWidget {
  @override
  _GrowingSmileysState createState() => _GrowingSmileysState();
}

class _GrowingSmileysState extends State<GrowingSmileys>
    with SingleTickerProviderStateMixin {
  late AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.5,
      upperBound: 1.0,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ScaleTransition(
            scale: CurvedAnimation(parent: c, curve: Curves.easeInOut),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: List.generate(
                9,
                (index) => Text(
                  '😊',
                  style: TextStyle(fontSize: 80),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() => c.dispose();
}
