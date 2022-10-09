import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool click = false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              click = !click;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            width: click ? 100 : 300,
            height: click ? 100 : 300,
            color: Colors.blue,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
