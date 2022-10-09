import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_one/stores/contact.dart' as contact_store;
import 'home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => contact_store.Contact(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'contact',
      home: HomePage(),
    );
  }
}
