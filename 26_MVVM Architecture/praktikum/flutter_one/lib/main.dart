import 'package:flutter/material.dart';
import 'package:flutter_one/screens/view/contacts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_one/screens/view_model/contact_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
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
      home: Contacts(),
      debugShowCheckedModeBanner: false,
    );
  }
}
