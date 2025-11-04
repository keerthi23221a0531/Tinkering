import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Info Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade100,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      // Named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/flutter': (context) => const AppScreen(
              appName: "Flutter",
              logoUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png",
            ),
        '/dart': (context) => const AppScreen(
              appName: "Dart",
              logoUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png",
            ),
        '/android': (context) => const AppScreen(
              appName: "Android",
              logoUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png",
            ),
        '/git': (context) => const AppScreen(
              appName: "Git",
              logoUrl:
                  "https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png",
            ),
      },
    );
  }
}

// ---------------- Home Screen ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _appCard(
      BuildContext context, String title, String route, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("💻 Explore Apps"),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _appCard(context, "Flutter", '/flutter', Colors.blue),
            _appCard(context, "Dart", '/dart', Colors.teal),
            _appCard(context, "Android", '/android', Colors.green),
            _appCard(context, "Git", '/git', Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}

// ---------------- App Info Screen ----------------
class AppScreen extends StatelessWidget {
  final String appName;
  final String logoUrl;

  const AppScreen({
    super.key,
    required this.appName,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // neutral background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appName,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black26)],
                ),
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  logoUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home, color: Colors.white),
                label: const Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // ✅ Changed to green
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
