import 'package:flutter/material.dart';
import 'package:flutter_one/data_contact.dart';
import 'package:flutter_one/model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_one/stores/contact.dart' as contact_store;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = '';
  String nomor = '';

  final _formKey = GlobalKey<FormState>();
  var namaController = TextEditingController(text: '');
  var nomorController = TextEditingController(text: '');
  

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
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

                    contactProvider.add(
                      GetContact(nama: nama, nomor: nomor),
                    );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const DataContact()));
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
