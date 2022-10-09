import 'package:flutter/material.dart';
class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController(text: 'beneboba');
  final nomorController = TextEditingController(text: '0851');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  validator: (String? value) =>
                      value == '' ? 'Harus input nama' : null,
                  decoration: const InputDecoration(
                    label: Text('Nama'),
                  ),
                ),
                TextFormField(
                  controller: nomorController,
                  validator: (String? value) =>
                      value == '' ? 'Harus input nomor' : null,
                  decoration: const InputDecoration(
                    label: Text('Nomor'),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                final contact = {
                  'nama': namaController.text,
                  'nomor': nomorController.text
                };

                Navigator.pop(context, contact);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
