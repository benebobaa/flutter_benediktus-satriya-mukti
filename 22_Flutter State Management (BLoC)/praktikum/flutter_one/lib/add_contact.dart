import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_one/bloc/contact_bloc.dart';
import 'package:flutter_one/home.dart';
import 'package:flutter_one/model/contact.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  String nama = '';
  String nomor = '';

  final _formKey = GlobalKey<FormState>();
  var namaController = TextEditingController(text: '');
  var nomorController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    ContactBloc bloc = BlocProvider.of<ContactBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: namaController,
                  onChanged: (String value) {
                    nama = value;
                  },
                  validator: (String? value) =>
                      value == '' ? 'Harus input nama' : null,
                  decoration: const InputDecoration(
                    label: Text('Nama'),
                  ),
                ),
                TextFormField(
                  controller: nomorController,
                  onChanged: (String value) {
                    nomor = value;
                  },
                  validator: (String? value) =>
                      value == '' ? 'Harus input nomor' : null,
                  decoration: const InputDecoration(
                    label: Text('Nomor'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    _formKey.currentState!.save();

                    final contact = Contact(name: nama, number: nomor);
                    context.read<ContactBloc>().add(AddContact(contact));
                    bool data = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(
                                  data: data,
                                )));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('CREATE CONTACT')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
