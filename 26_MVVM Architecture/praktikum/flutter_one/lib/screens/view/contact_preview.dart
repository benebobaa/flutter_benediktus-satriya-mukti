import 'package:flutter/material.dart';
import 'package:flutter_one/screens/view_model/contact_view_model.dart';
import 'package:provider/provider.dart';

class ContactPreview extends StatelessWidget {
  final int index;
  const ContactPreview({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    final contact = modelView.contacts[index];
    return Container(
      color: Colors.white,
      child: Center(
          child: SizedBox(
        width: 300,
        height: 300,
        child: Card(
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                contact.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                contact.phone.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
