import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_one/stores/contact.dart' as contact_store;

class DataContact extends StatefulWidget {
  const DataContact({super.key});

  @override
  State<DataContact> createState() => _DataContactState();
}

class _DataContactState extends State<DataContact> {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
          itemCount: contactProvider.contacts.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.green[100],
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(contactProvider.contacts[index].nama),
                subtitle: Text(contactProvider.contacts[index].nomor),
                trailing: const Icon(Icons.delete),
              ),
            );
          }),
    );
  }
}
