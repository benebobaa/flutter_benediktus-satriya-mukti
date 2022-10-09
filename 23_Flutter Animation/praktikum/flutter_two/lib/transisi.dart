import 'package:flutter/material.dart';
import 'input_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Contacts(),
    );
  }
}

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List listContact = [
    {'nama': 'Benediktus', 'nomor': '12343435435'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: listContact.length,
        itemBuilder: (context, index) => ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(listContact[index]['nama']),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(listContact[index]['nomor']),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final Map<String, dynamic> result = await Navigator.of(context).push(
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
            return const InputData();
          }, transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);

            return SlideTransition(
                position: animation.drive(tween), child: child);
          }));
          listContact.add(result);

          setState(() {});
        },
      ),
    );
  }
}
