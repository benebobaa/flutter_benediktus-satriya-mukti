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
          final Map<String, dynamic> result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InputData(),
            ),
          );
          listContact.add(result);

          setState(() {});
        },
      ),
    );
  }
}
