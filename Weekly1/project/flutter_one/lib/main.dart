import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactUs(),
    );
  }
}

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final msgController = TextEditingController();

  String name = '';
  String email = '';
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Center(
                  child: Text(
                    'Beneboba',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Need to get touch with us? Either fill out the form with your inquiry or find the department email you like to contact below.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 70),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        fillColor: Colors.grey[300],
                        filled: true),
                  ),
                  const SizedBox(height: 20),
                  const Text('Email'),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        fillColor: Colors.grey[300],
                        filled: true),
                  ),
                  const SizedBox(height: 20),
                  const Text('What we can help you with?'),
                  TextField(
                    controller: msgController,
                    minLines: 3,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        fillColor: Colors.grey[300],
                        filled: true),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        name = nameController.text;
                        email = emailController.text;
                        msg = msgController.text;

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Column(
                              children: [
                                Text(name),
                                Text(email),
                              ],
                            ),
                            content: Text(msg),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  color: Colors.indigo,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text(
                                    'Okay',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
