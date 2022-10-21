import 'package:flutter/material.dart';
import 'package:flutter_one/screens/view/contact_preview.dart';
import 'package:flutter_one/screens/view_model/contact_view_model.dart';
import 'package:provider/provider.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Contacts'),
        ),
      ),
      body: ListView.builder(
        itemCount: modelView.contacts.length,
        itemBuilder: (context, index) {
          final contact = modelView.contacts[index];
          var indexContact = modelView.contacts[index];
          return InkWell(
            child: ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.phone),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactPreview(index: index)));
            },
          );
        },
      ),
    );
  }
}
