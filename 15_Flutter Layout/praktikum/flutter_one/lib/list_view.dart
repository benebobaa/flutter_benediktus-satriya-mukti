import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'listView',
      home: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('List View'),
        ),
        body: ListView(
          children: [
            listTile(avatar: 'L', nama: 'Leanne Graham', nomor: '12445-44'),
            listTile(avatar: 'E', nama: 'Ervin Howell', nomor: '021-31221'),
            listTile(
                avatar: 'C', nama: 'Clementine Bauch', nomor: '1-2321-21-3'),
            listTile(avatar: 'P', nama: 'Patricia Lebsack', nomor: '43324-432'),
            listTile(avatar: 'C', nama: 'Chelsey Dietrich', nomor: '(234)4834'),
            listTile(
                avatar: 'M',
                nama: 'Mrs. Dennis Schulist',
                nomor: '1-4334-3434'),
            listTile(avatar: 'K', nama: 'Kurtis Weissnat', nomor: '210.232.32'),
            listTile(avatar: 'K', nama: 'Kurtis Weissnat', nomor: '210.232.32'),
            listTile(avatar: 'K', nama: 'Kurtis Weissnat', nomor: '210.232.32'),
            listTile(avatar: 'K', nama: 'Kurtis Weissnat', nomor: '210.232.32'),
            listTile(avatar: 'K', nama: 'Kurtis Weissnat', nomor: '210.232.32')
          ],
        ));
  }

  ListTile listTile(
      {required String avatar, required String nama, required String nomor}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10, left: 10),
      leading: CircleAvatar(
        backgroundColor: Colors.green[400],
        child: Text(
          avatar,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Padding(padding: const EdgeInsets.only(), child: Text(nama)),
      subtitle: Padding(padding: const EdgeInsets.only(), child: Text(nomor)),
    );
  }
}
