import 'package:flutter/material.dart';
import 'package:flutter_one/services.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RestApi(),
    );
  }
}

class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  Person? person;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halo'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: const Text('Name'),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: jobController,
                decoration: InputDecoration(
                  label: const Text('Job'),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        Person? result = await MyService().fetchUsers();
                        if (result != null) {
                          setState(
                            () {
                              person = result;
                            },
                          );
                        }
                      },
                      child: const Text('GET'),
                    ),
                  ),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        Person? result = await MyService().createUser(
                          name: nameController.text,
                          job: jobController.text,
                        );
                        if (result != null) {
                          setState(
                            () {
                              person = result;
                            },
                          );
                        }
                      },
                      child: const Text('POST'),
                    ),
                  ),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        Person? result = await MyService().updateUser(
                          name: nameController.text,
                          job: jobController.text,
                        );
                        if (result != null) {
                          setState(
                            () {
                              person = result;
                            },
                          );
                        }
                      },
                      child: const Text('PUT'),
                    ),
                  ),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        Person? result = await MyService().deleteUser();
                        if (result != null) {
                          setState(
                            () {
                              person = result;
                            },
                          );
                        }
                      },
                      child: const Text('DELETE'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Result',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              person != null ? Text(person!.data) : const Text('No data'),
            ],
          ),
        ),
      ),
    );
  }
}
