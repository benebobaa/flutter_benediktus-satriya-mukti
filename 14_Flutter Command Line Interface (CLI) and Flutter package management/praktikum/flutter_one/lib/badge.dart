import 'package:flutter/material.dart';
import 'package:badges/badges.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'badge',
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: Colors.deepPurple,
                  label:
                      Text('BADGE', style: TextStyle(color: Colors.grey[200])),
                ),
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                  badgeContent:
                      Text('BADGE', style: TextStyle(color: Colors.grey[200])),
                ),
              ],
            ),
          ),
        ));
  }
}
