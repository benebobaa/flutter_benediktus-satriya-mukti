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
    return MaterialApp(
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
        title: Text('Halo'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    label: Text('Job'),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 10),
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
                        child: Text('GET'),
                      ),
                    ),
                    SizedBox(width: 24),
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
                        child: Text('POST'),
                      ),
                    ),
                    SizedBox(width: 24),
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
                        child: Text('PUT'),
                      ),
                    ),
                    SizedBox(width: 24),
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
                        child: Text('DELETE'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Result',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                person != null ? Text(person!.data) : Text('No data'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
